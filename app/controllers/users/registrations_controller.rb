class Users::RegistrationsController < Devise::RegistrationsController

  def create
    build_resource(sign_up_params)
    if resource.save
      token = Tiddle.create_and_return_token(resource, request)
      render json: { user: resource, authentication_token: token }.to_json
    else
      render json: resource.errors.to_json, status: 500
    end
  end

  def update
    if update_resource(current_user, account_update_params)
      render json: current_user.to_json
    else
      render json: current_user.errors.to_json, status: 500
    end
  end

  private

  def sign_up_params
    params.require(:user).permit(:name, :avatar, :avatar_url, :password, :email)
  end

  def account_update_params
    params.require(:user).permit(:name, :avatar, :avatar_url, :email)
  end

end
