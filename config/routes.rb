Rails.application.routes.draw do
  get 'signup/index'
  post 'signup/login' => 'signup#login', :as => :signup_login
  delete 'signup/logout' => 'signup#logout', :as => :signup_logout
  get 'signup/profile'
  root 'signup#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
