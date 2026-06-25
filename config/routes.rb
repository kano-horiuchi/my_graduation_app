Rails.application.routes.draw do
  get "password_resets/new"
  get "password_resets/edit"
  get "profiles/edit"
  get "profiles/update"
  root "static_pages#top"
  resources :users, only: %i[new create]
  resource :mypage, only: %i[show], controller: "mypages"
  resource :profile, only: %i[show edit update]
  resources :password_resets, only: %i[new create edit update]
  resources :boards do
    collection do
      get "search"
      get "autocomplete"
      get :favorites
    end
    resource :favorite, only: [ :create, :destroy ]
  end
  get "terms", to: "static_pages#terms"
  get "privacy", to: "static_pages#privacy"

  post "oauth/callback/:provider" => "oauths#callback"
  get "oauth/callback/:provider" => "oauths#callback"
  post "oauth/:provider" => "oauths#oauth", :as => :auth_at_provider

  get "login", to: "user_sessions#new"
  post "login", to: "user_sessions#create"
  delete "logout", to: "user_sessions#destroy"

  get "up" => "rails/health#show", as: :rails_health_check

  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  if Rails.env.test?
    post "/auth/:provider/callback", to: "oauths#callback"
  end
  namespace :admin do
    root "dashboards#index"
    resources :users, only: [ :index, :show, :edit, :update, :destroy ]
    resources :boards, only: [ :index, :destroy ]
  end
end
