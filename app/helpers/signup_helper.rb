module SignupHelper

  def log_in(token)
    @api = CoffeeApiService.new
    user_info = JSON.parse(@api.user_info(token).body)
    unless user_info.nil? or user_info.empty?
      session[:token] = token
      session[:id] = user_info['user_id']
    end
    user_info
  end

end
