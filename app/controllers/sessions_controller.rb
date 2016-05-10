class SessionsController < ApplicationController
  def new
  end
  
  def create
    @school = School.find_by(email: params[:session][:email].downcase)
    if @school && @school.authenticate(params[:session][:password])
      session[:school_id] = @school.id
      flash[:info] = "logged in as #{@school.name}"
      redirect_to @school
    else
      flash[:danger] = 'メールアドレスおよびパスワードが違います。'
      render 'new'
    end
  end
  
  def destroy
    session[:school_id] = nil
    redirect_to root_path
  end
  
end
