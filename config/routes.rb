Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :users, only: [:create, :new, :index]
      post '/login', to: 'users#login'
      resources :user_trips, only: [:create, :new, :index]
      post '/forecast', to: 'user_trips#forecast', as: 'forecast'
      get '/tripwithuser/:id', to: 'user_trips#withuserid', as: 'withuserid'
      post '/user_trips/newlocation', to: 'user_trips#newlocation', as: 'newlocation'
    end
  end

end
