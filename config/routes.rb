Rails.application.routes.draw do
  get "profiles/edit"
  get "profiles/update"
  root "static_pages#top"
  resources :users, only: %i[new create]
  resource :mypage, only: %i[show], controller: "mypages"
  resource :profile, only: %i[show edit update]
  resources :boards do
    collection do
      get "search"
    end
  end
  get "terms", to: "static_pages#terms"
  get "privacy", to: "static_pages#privacy"
  get "login", to: "user_sessions#new"
  post "login", to: "user_sessions#create"
  delete "logout", to: "user_sessions#destroy"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  namespace :admin do
    get "dashboards/index"
    root "dashboards#index"
  end
  # Defines the root path route ("/")
  # root "posts#index"
end
