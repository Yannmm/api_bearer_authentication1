Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  root "home#index"

  resources :posts
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  

  resources :api_tokens, only: [:index, :create, :update]

  namespace :api do 
    namespace :v1 do 
      defaults format: :json do 
        get 'home/index', to: 'home#index'
        resources :posts, only: [:index, :show, :create, :update, :destroy]
      end
    end
  end

end
