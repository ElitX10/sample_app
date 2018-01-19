module SessionsHelper

  def deny_access
    store_location
    redirect_to signin_path, :notice => "Merci de vous identifier pour rejoindre cette page."
  end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    clear_return_to
  end

  def current_user?(user)
    user == @current_user
  end

  private

  def store_location
    session[:return_to] = request.fullpath
  end

  def clear_return_to
    session[:return_to] = nil
  end

end
