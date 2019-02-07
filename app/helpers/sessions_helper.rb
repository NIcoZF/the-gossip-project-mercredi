module SessionsHelper
  def log_in
    session[:user_id] = user.id
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user])
  end


  def current_user(user)
    current_user == user
  end

  def logged_in
    !current_user.nil?
  end

  def remember (user)
    user.remember
  end


  def forget(user)
    user.forget
  end

  def log_out
    forget (current_user)
    session.delete(:user_id)
    @current_user = nil
  end

end
