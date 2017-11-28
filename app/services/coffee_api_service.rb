class CoffeeApiService
  include HTTParty

  base_uri Settings.base_uri

  def initialize
    @auth = {:api_secret => Settings.app_secret}
  end

  def user_info(token)
    options = @auth.merge({:token => token})
    self.class.get('/marketing/login/info', :query => options)
  end
end