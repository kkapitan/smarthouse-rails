class Admin::ActionSubjectsController < ApplicationController

  def index
    @action_subjects = ActionSubject.all
    render :template =>"/admin/action_subjects/index.html.erb", :status => 200
  end

  def new
    @action_subject = ActionSubject.new
    render :template =>"/admin/action_subjects/new.html.erb", :status => 200
  end

  def create
    @action_subject = ActionSubject.new(action_subject_params)
    if @action_subject.save
      flash[:success] = 'Subject added successfully!'
      redirect_to "/action_subjects"
    else
      flash[:danger] = 'There was some error. Please try again.'
      render 'new'
    end
  end

  private
  def action_subject_params
    params.require(:action_subject).permit(:name)
  end

end
