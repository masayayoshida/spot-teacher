class SchoolsController < ApplicationController
  #before_action :logged_in_school, only: [:edit, :update, :show]
  before_action :set_school, :collect_school, only: [:edit, :update, :show]
    
  def show
    @lessons = @current_school.lessons
  end
  
  def new
    @school = School.new
  end
    
  def create
    @school = School.new(school_params)
    if @school.save
      flash[:success] = "新規登録完了しました。"
      redirect_to @school
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @school.update(school_params)
      flash[:success] = "登録情報を変更しました"
      redirect_to @school , notice: '登録情報を編集しました'
    else
      # 保存に失敗した場合は編集画面へ戻す
      render 'edit'
    end
  end
    
  private
    
  def school_params
    params.require(:school).permit(:name, :email, :address1, :address2, :phone,
        :chara, :url, :password, :password_confirmation)
  end
  
  def set_school
    @school = School.find(params[:id])
  end
  
  def collect_school
    redirect_to(root_url) if current_school != @school
  end
end
