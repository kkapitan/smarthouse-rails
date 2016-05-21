class Api::V1::UsersController < ApplicationController
  respond_to :json

  def show
    @user = User.find(params[:id])
    render :template =>"/api/v1/users/show.json.jbuilder", :status => 200, :formats => [:json]
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render :template =>"/api/v1/users/create.json.jbuilder", :status => 201, :formats => [:json]
    else
      render :template =>"/api/v1/users/errors.json.jbuilder", :status => 422, :formats => [:json]
    end
  end

  private
    def user_params
      params.permit(:email, :password, :password_confirmation)
    end

end
