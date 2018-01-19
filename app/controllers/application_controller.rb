class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_current_user

  private

  def set_current_user
    if session[:cat_id]
      @current_user = Cat.find(session[:cat_id])
    end
  end
end
