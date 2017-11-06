Rails.application.routes.draw do
  devise_for :users

  root "homepage#landing_page"

  namespace :admin do
    resources :users
  end

  namespace :player do

  end
end
