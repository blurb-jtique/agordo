# Spike: Integrate Apple Pay via Braintree in Blurby

## Objective
Detail the requirements and step-by-step implementation plan to add Apple Pay as a payment method in Blurby using Braintree.

## Requirements
- Apple Developer account and merchant registration for Apple Pay
- Access to Braintree dashboard with Apple Pay enabled
- Update Braintree credentials/configuration in Blurby
- Frontend support for Apple Pay (Safari, iOS/macOS)
- Backend changes to process Apple Pay payment method nonces via Braintree
- Compliance with PCI DSS and Apple Pay guidelines
- Test environment for end-to-end validation

## Step-by-Step Implementation

### 1. Apple Pay Setup
- Register for an Apple Developer account
- Create and verify a Merchant ID in the Apple Developer portal
- Set up Apple Pay certificates and upload to Braintree dashboard ([Braintree Apple Pay Setup](https://developer.paypal.com/braintree/docs/guides/apple-pay/overview))
- Enable Apple Pay in Braintree control panel

### 2. Update Braintree Configuration in Blurby
- Add Apple Pay configuration to Braintree credentials (see `config/deploy/blurby_tasks.rb`)
- Ensure merchant account IDs and keys are up to date
- Confirm BraintreeAdapter supports payment method nonces for Apple Pay

### 3. Frontend Integration
- Add Apple Pay button to checkout page (only show on supported devices/browsers)
- Use Braintree JS SDK to integrate Apple Pay ([Braintree JS Apple Pay Docs](https://developer.paypal.com/braintree/docs/guides/apple-pay/client-side/javascript/v3))
- Collect payment info and generate a payment method nonce

### 4. Backend Integration
- Update checkout flow to accept Apple Pay payment method nonce
- In `BraintreeAdapter`, process Apple Pay nonce as with other payment methods:
  - Use `payment_method_info` to format nonce
  - Submit transaction via Braintree
- Handle errors, refunds, and settlement as with credit cards

### 5. Testing
- Test Apple Pay integration in Braintree sandbox
- Validate payment flow, error handling, and order updates
- Ensure compliance with Apple Pay and PCI requirements

### 6. Documentation and Rollout
- Document integration steps and update developer onboarding
- Prepare for production rollout (update certificates, test on live)
- Monitor transactions and error logs for Apple Pay payments

## References
- [Braintree Apple Pay Overview](https://developer.paypal.com/braintree/docs/guides/apple-pay/overview)
- [Braintree JS Apple Pay Integration](https://developer.paypal.com/braintree/docs/guides/apple-pay/client-side/javascript/v3)
- [Apple Pay JS API](https://developer.apple.com/documentation/apple_pay_on_the_web/applepayjs)
- `lib/transaction/lib/gateway_adapters/braintree_adapter.rb` (Blurby Braintree integration)
- `config/deploy/blurby_tasks.rb` (Braintree config)

## Notes
- Apple Pay via Braintree is the recommended approach for Blurby, leveraging existing payment infrastructure and minimizing PCI scope.
- Most changes are isolated to frontend (Apple Pay button, JS integration) and backend (handling nonces in BraintreeAdapter).
- Apple Pay can be enabled for web and native apps using the same Braintree integration.
