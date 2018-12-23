class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :is_logged_in
  helper_method :current_user
  helper_method :is_admin

  def is_logged_in
    session[:user_id].present?
  end

  def current_user
    User.find_by(id: session[:user_id])
  end

  def is_admin(user)
    if user.admin?
      "ADMIN"
    end
  end

end
