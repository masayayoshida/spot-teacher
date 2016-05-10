class LessonsController < ApplicationController
  before_action :set_lesson, :collect_school, only: [:edit, :update, :show]
  
  def new
    @lesson = Lesson.new
  end

  def create
    @lesson = current_school.lessons.build(lesson_params)
    if @lesson.save
      redirect_to request.referrer , notice: " #{@lesson.name} を登録しました。"
    else
      render :new
    end
  end
  
  def edit
    @lesson = current_school.lessons.find_by(id: params[:id])
  end
  
  def update
    if @lesson.update(lesson_params)
      flash[:success] = "講座情報を変更しました"
      redirect_to school_url(current_school) , notice: '講座情報を編集しました'
    else
      # 保存に失敗した場合は編集画面へ戻す
      render 'edit'
    end
  end
  
  def destroy
    @lesson = current_school.lessons.find_by(id: params[:id])
    redirect_to request.referrer if @lesson.nil?
    @lesson.destroy
    flash[:success] = "講座を削除しました"
    redirect_to request.referrer || root_url
  end

  private
  
  def set_lesson
    @lesson = Lesson.find(params[:id])
  end
  
  def collect_school
    redirect_to(root_url) if current_school != @lesson.school
  end
  
  def lesson_params
    params.require(:lesson).permit(:name, :lesson_date, :end_time)
  end
  
end
