module SessionsHelper

  def current_user(options)
    user_includes = options.has_key?(:includes) ? options[:includes] : []
    x = Session.includes([user: user_includes]).find_by(session_code: cookies[:session_code])
   	@current_user = x.nil? ? nil : x.user
  end

end
