class Admin::UsersController < ApplicationController

  def index
    @users = User.all
    render :template =>"/admin/users/index.html.erb", :status => 200
  end

  def new
    @user = User.new
    render :template =>"/admin/users/new.html.erb", :status => 200
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'User added successfully!'
      redirect_to "/users"
    else
      flash[:danger] = 'There was some error. Please try again.'
      render 'new'
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end