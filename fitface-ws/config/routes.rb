FitfaceWs::Application.routes.draw do
  devise_for :users, controllers: { registrations: "v1/registrations", sessions: "v1/sessions" }

  namespace :v1 do
    devise_scope :user do
      post "/register"                                            => "registrations#create"
      post "/sign-in"                                             => "sessions#create"
    end

    resources :accounts, controller: :users, only: [:edit, :update, :destroy] do
      collection{
        resources :sports, only: [:create, :destroy]
        resources :gyms, only: [:create, :destroy] do
          collection{
            get "/search"                                         => "gyms#search"
          }
        end

        resources :outdoors, only: [:create, :destroy]
        resources :workouts, only: [:create, :destroy]
        resources :events, only: [:create, :destroy]
        resources :photos, only: [:create, :index, :destroy]
        resources :check_ins, only: [:index, :create]
        resources :blocks, only: [:index, :destroy]
        resources :partners, only: [:index, :destroy]
        resources :motivates, only: [:index, :create, :destroy]

        put "/password"                                           => "users#password"
        post "/send-password"                                     => "users#send_email_password"
        get "/security"                                           => "users#security"
        get "/notifications"                                      => "users#notifications"
        get "/preferences"                                        => "users#preferences"
      }
    end

    resources :users, only: [:show] do
      resources :blocks, only: [:create]
      resources :partners, only: [:create]
    end

    resources :gyms, only: [:index]
    resources :sports, only: [:index]
    resources :outdoors, only: [:index]
    resources :workouts, only: [:index]
    resources :events, only: [:index]
  end

end
