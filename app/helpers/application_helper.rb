module ApplicationHelper
  def bootstrap_class_for(flash_type)
    case flash_type
      when 'success'
        'alert-success' # Green
      when 'error'
        'alert-danger' # Red
      when 'alert'
        'alert-warning' # Yellow
      when 'notice'
        'alert-info' # Blue
      else
        flash_type.to_s
    end
  end
  def current_user
    @current_user ||= User.find_by_id(session[:id])
  end
  def logged_in?
    !current_user.nil?
  end
  def user_logout
    session[:id] = nil
  end


end
