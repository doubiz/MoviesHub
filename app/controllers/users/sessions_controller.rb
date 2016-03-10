class Users::SessionsController < Devise::SessionsController

  def create
    user = warden.authenticate!(auth_options)
    if user
      token = Tiddle.create_and_return_token(user, request)
      render json: { authentication_token: token }
    else
      render json: "Invalid email or password", status: 500
    end
  end

  def destroy
    Tiddle.expire_token(current_user, request) if current_user
    render json: {}
  end

  private

  def verify_signed_out_user
  end

end
