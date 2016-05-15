class Api::V1::UsersController < ApplicationController
  respond_to :json

  def show
    @user = User.find(params[:id])
    render :template =>"/api/v1/users/show.json.jbuilder", :status=> 200, :formats => [:json]
  end

end
