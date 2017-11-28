class SignupController < ApplicationController
  include SignupHelper
  include ApplicationHelper

  def index
    if logged_in?
      redirect_to action: 'profile'
    end
  end

  def login
    user_params = log_in params[:token]
    if user_params.nil?
      flash[:error] = 'Não foi possível realizar o login, tente novamente.'
      render :json => {
          :status => 'error',
          :location => url_for(:controller => 'signup', :action => 'index')
      }
      return
    end

    @user = User.find_by_id( user_params['user_id'])
    if @user.nil?
      @user = User.create(id: user_params['user_id'])
    end
    @user.email = user_params['email']
    @user.name = user_params['name']
    @user.picture_url = user_params['picture_url']

    logger.debug user_params

    if request.xhr?
      if @user.save
        render :json => {
            :status => :created,
            :location => url_for(:controller => 'signup', :action => 'profile')
        }
      end

    end
  end

  def logout
    user_logout
    redirect_to action: 'index'
  end

  def profile
    unless logged_in?
      redirect_to action: 'index'
    end
  end

end
