class Api::V1::SessionsController < ApplicationController

  def create
    user_password = params[:session][:password]
    user_email = params[:session][:email]
    @user = user_email.present? && User.find_by(email: user_email)

    if @user.valid_password? user_password
      sign_in @user, store: false
      @user.generate_authentication_token!
      @user.save
      render template: "/api/v1/sessions/create.json.jbuilder", status: 201
    else
      render template: "/api/v1/sessions/errors.json.jbuilder", status: 422
    end
  end
end
