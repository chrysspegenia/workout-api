Rails.application.routes.draw do
  root 'pages#index'
  
  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
    },
    controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
    }


  namespace :api do
    namespace :v1 do
      resources :categories do
        get 'tasks', to: 'tasks#index_category_tasks'
      end
      resources :tasks do
        member do
          patch :completed
        end
      end
    end
  end

  get '*path', to: 'pages#index', via: :all
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
