Rails.application.routes.draw do
  devise_for :users

  root "homepage#landing_page"

  namespace :admin do

  end

  namespace :player do

  end
end
