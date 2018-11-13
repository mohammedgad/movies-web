class ApplicationController < ActionController::Base
  helper_method :is_logged?

  def check_logged?
    redirect_to movies_path if session['user_token'].present?
  end

  def is_logged?
    session['user_token'].present?
  end
end
