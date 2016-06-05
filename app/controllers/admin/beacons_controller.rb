class Admin::BeaconsController < ApplicationController

  def index
    @beacons = Beacon.all
    render :template =>"/admin/beacons/index.html.erb", :status => 200
  end

  def new
    @beacon = Beacon.new
    render :template =>"/admin/beacons/new.html.erb", :status => 200
  end

  def create
    @beacon = Beacon.new(user_params)
    if @beacon.save
      flash[:success] = 'Beacon added successfully!'
      redirect_to "/beacons"
    else
      flash[:danger] = 'There was some error. Please try again.'
      render 'new'
    end
  end

  private
  def user_params
    params.require(:beacon).permit(:name, :major)
  end

end