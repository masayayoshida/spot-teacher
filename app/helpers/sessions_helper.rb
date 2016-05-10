module SessionsHelper
  def current_school
    @current_school ||= School.find_by(id: session[:school_id])
  end

  def logged_in?
    !!current_school
  end

  def store_location
    session[:forwarding_url] = request.url if request.get?
  end
end
