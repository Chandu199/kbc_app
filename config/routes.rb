Rails.application.routes.draw do
  devise_for :users

  root "homepage#landing_page"

  namespace :admin do
    resources :users

    resources :tests do
      patch 'assign_test', to: 'tests#assign_test'
      resources :questions do
        resources :options
      end
    end

  end

  namespace :player do
    resources :user, only: [:update] do
      get 'get_questions', to: "tests#get_questions"
      patch 'answer_questions', to: 'tests#answer_questions'
    end
  end
end
