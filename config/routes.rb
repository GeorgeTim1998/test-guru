Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'tests#index'

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sigh_out: :logout, sign_up: :signup }

  resources :tests, only: :index do
    member do
      post :start
    end
  end

  resources :results, only: %i[show update] do
    member do
      get :summary
    end
  end

  namespace :admin do
    resources :tests do
      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end
  end
end
