class Users::RegistrationsController < Devise::RegistrationsController
  skip_before_filter :authenticate_user_from_token!, :only => [:create]
  skip_after_filter  :verify_authorized

  def create
    user = User.new(sign_up_params)
    if user.save
      user.ensure_authentication_token
      if user.active_for_authentication?
        handle_success(user)
      else
        # TODO guide to activation
        handle_success(user)
      end
    else
      clean_up_passwords user
      render json: user.errors, status: :unprocessable_entity
    end
  end

  def sign_up_params
    devise_parameter_sanitizer.sanitize(:sign_up)
  end

  private

  def handle_success(user)
    token = user.ensure_authentication_token
    email = AES.encrypt(user.email, Bookshelf::Application.config.secret_key_base)
    render :json => {:email => email, :token => token}
  end
end