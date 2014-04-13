class ApplicationController < ActionController::API
  include ActionController::MimeResponds
  include Pundit

  before_filter :authenticate_user_from_token!
  before_filter :authenticate_user!

  after_action :verify_authorized
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def authenticate_user_from_token!
    auth_service = AuthenticationService.new
    user = auth_service.authenticated?(request.headers["email"], request.headers["token"])
    sign_in user, store: false if user
  end

  def user_not_authorized
    current_user.logout
    render :nothing => true, :status => :unauthorized
  end

end
