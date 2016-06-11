class Admin::StaticPagesController < ApplicationController

  def home
    render :template =>"/admin/static_pages/home.html.erb", :status => 200
  end

end