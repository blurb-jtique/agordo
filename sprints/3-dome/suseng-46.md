SUSENG-46
=========

This pull request focuses on improving the handling and presentation of user avatars, particularly by introducing a new method in the UserPresenter class and updating related components to use this method, one of the purpose is enabling the open graph support when sharing a profile in FB.

The most important changes include adding the avatar_full_url method to UserPresenter, updating the BookstoreController to use this new method, and adding tests for the avatar_full_url method.

Enhancements to User Avatar Handling:

- app/presentation/user_presenter.rb: Added the avatar_full_url method to build and return the full URL for a user's avatar, handling both absolute and relative URLs. This method includes detailed documentation and error handling.
- app/controllers/bookstore_controller.rb: Updated the user_profile method to use the UserPresenter#avatar_full_url method instead of directly accessing the user's avatar URL.
- app/models/user.rb: Added comments to the avatar_full_url method indicating that it is not functioning correctly and should be replaced by UserPresenter#avatar_full_url.

**Testing**:
spec/presentation/user_presenter_spec.rb: Added tests for the avatar_full_url method in the UserPresenter class, covering scenarios with absolute URLs, relative URLs, and error handling.