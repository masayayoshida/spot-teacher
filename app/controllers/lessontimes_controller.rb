class LessontimesController < ApplicationController
  before_action :logged_in_school

  def new
    @lessontime = current_school.lessontimes
  end

  def create
    current_school.appointing(params[:appotime]) 
    redirect_to new_lessontime_url
  end

  def destroy
    current_school.unappointing(params[:appotime])
    redirect_to new_lessontime_url
  end

end
