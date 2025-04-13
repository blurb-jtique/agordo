# Product specification validation

The product specification validation process is a critical step in the pricing and ordering workflow. It ensures that the combination of product options selected by the customer is valid and can be manufactured according to the platform's capabilities. This validation is performed by the `Validators::ProductSpecValidator` class, which examines a `ProductSpec` object against a set of predefined rules.

## Validation Process

1. **Initialization**
   - When a `ProductSpec` object is created with the chosen product options (cover type, paper type, etc.), it instantiates a `ProductSpecValidator`.
   - The validator is designed to check whether the combination of options is valid for pricing and manufacturing.

2. **Two-Phase Validation**
   - The validation occurs in two distinct phases, both of which must pass for the specification to be considered valid:

     ```ruby
     valid_constraints? && valid_capabilities?
     ```

3. **Constraint Validation**
   - The `valid_constraints?` method checks high-level logical constraints:
     - Determines whether endsheets are required based on the book type (pocket/trade books and softcover books don't need endsheets)
     - Checks if magazine features (coating type, cover paper type) are required for letter-sized products
     - Verifies that the product dimension supports the selected paper type
     - Enforces constraint rules, such as "softcover books cannot have endsheets"
     - Applies special validation rules for trade books

4. **Capabilities Validation**
   - The `valid_capabilities?` method ensures that all product features are within the capabilities of the selected product class:

     ```ruby
     valid_pages? && valid_cover_paper_type? && valid_coating_type? && valid_book_covering? && valid_endsheet_type?
     ```

     a. **Page Count Validation**
     - Checks that the number of pages is within the minimum and maximum limits for the product class
     - Verifies that the selected paper type supports the specified page count
     - Example error messages:
       - "Page count is above the specified page maximum"
       - "Page count is below the specified page minimum"
       - "Page count is unsupported by this paper."

     b. **Cover Paper Type Validation**
     - Ensures the selected cover paper type is included in the list of allowed types for the product class

     c. **Coating Type Validation**
     - Verifies the coating type is compatible with the product class

     d. **Book Covering Validation**
     - Checks that book covering (linen material) is present for dustjacket books
     - Ensures book covering is absent for books that don't support it

     e. **Endsheet Type Validation**
     - Confirms that endsheets are not specified for layflat books (which don't use traditional endsheets)

5. **Trade Book Special Validations**
   - Trade books have unique requirements with specific allowed combinations of:
     - Paper type (standard color, standard B&W, economy color, economy B&W)
     - Book dimensions (5×8, 6×9, 8×10)
     - Cover type (hardcover, softcover, imagewrap)
   - The system uses a predefined hash table (`valid_trade_book_combo_hash`) to validate these combinations

6. **Error Collection**
   - When validation fails, the validator adds descriptive error messages to the `errors` hash:

     ```ruby
     errors[:pages_below_minimum] = "Page count is below the specified page minimum"
     ```

   - These errors provide detailed feedback about why a particular combination is invalid

7. **Product Classification**
   - The validation process uses the product's classification (determined by `ProductClassifier`) to identify the applicable rules
   - Different products (StandardBook, TradeBook, PremiumMagazine, etc.) have different capabilities and constraints

## Validation Examples

1. **Standard Photo Book**
   - A standard square photo book with hardcover, standard paper, and 20 pages
   - Validation passes because all specifications are within standard capabilities

2. **Invalid Trade Book Configuration**
   - A trade book with standard color paper in 8×10 size with hardcover
   - Validation fails because this specific combination is not in the allowed list

3. **Invalid Page Count**
   - A magazine with 400 pages
   - Validation fails because the page count exceeds the maximum for magazines (240 pages)

4. **Invalid Book Covering**
   - A softcover book with linen covering
   - Validation fails because softcover books cannot have book coverings
