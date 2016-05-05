module SessionsHelper

  def login(user)
    #when a user logs in we start a session and store the user id in the session hash
    session[:user_id] = user.id
    @current_user = user
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def logged_in?
    if current_user == nil
      #redirect_to login page if not logged in
      redirect_to new_session_path
    end
  end

  def logout
    # when the user logs out, we need to clear the user_id from the session
    @current_user = session[:user_id] = nil
  end

  def authorize
    redirect_to '/login' unless current_user
  end
  
end
