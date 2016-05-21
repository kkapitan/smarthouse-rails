class Api::V1::SessionsController < ApplicationController
  before_action :authenticate_with_token!, only: [:destroy]

  def create
    user_password = params[:password]
    user_email = params[:email]
    @user = user_email.present? ? User.find_by(email: user_email) : nil

    if @user.present? and @user.valid_password? user_password
      sign_in @user, store: false
      @user.generate_authentication_token!
      @user.save
      render template: "/api/v1/sessions/create.json.jbuilder", status: 201
    else
      render template: "/api/v1/sessions/errors.json.jbuilder", status: 422
    end
  end

  def destroy
    current_user.generate_authentication_token!
    current_user.save
    head 204
  end
end
