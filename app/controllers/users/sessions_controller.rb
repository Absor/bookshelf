class Users::SessionsController < Devise::SessionsController

  skip_before_filter :authenticate_user_from_token!, :only => [:create]
  skip_after_filter  :verify_authorized

  def create
    resource = User.find_for_database_authentication(email: params[:email])
    return failure unless resource
    return failure unless resource.valid_password?(params[:password])
    handle_success(resource)
  end

  def destroy
    current_user.logout
    render :nothing => true
  end

  private

  def failure
    render :nothing => true, :status => :unauthorized
  end

  def handle_success(resource)
    token = resource.ensure_authentication_token
    email = AES.encrypt(resource.email, Bookshelf::Application.config.secret_key_base)
    render :json => {:email => email, :token => token}
  end

end