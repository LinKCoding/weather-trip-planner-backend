Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :users, only: [:create, :new, :index]
      post '/login', to: 'users#login'
      resources :user_trips, only: [:create, :new, :index]
      get '/tripwithuser/:id', to: 'user_trips#withuserid', as: 'withuserid'
    end
  end

end
