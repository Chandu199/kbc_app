Rails.application.routes.draw do
  devise_for :users

  root "homepage#landing_page"

  namespace :admin do
    resources :users

    resources :tests do
      resources :questions do
        resources :options
      end
    end

  end

  namespace :player do

  end
end
