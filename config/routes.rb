Rails.application.routes.draw do
  devise_for :users

  root "homepage#landing_page"
  
  namespace :admin do
    get 'tests'
    get 'users'
  end

end
