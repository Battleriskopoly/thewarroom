module GamesHelper
  def current_user
    remember_token = User.digest(cookies[:remember_token])
	logger.info "called"
    @current_user ||= User.find_by(remember_token: remember_token)
  end
end
