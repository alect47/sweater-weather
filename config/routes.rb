Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'

    namespace :api do
      namespace :v1 do
        get '/forecast', to: 'forecast#show'
        get '/coordinates', to: 'location#show'
        get '/backgrounds', to: 'background#show'
        post '/users', to: 'users#create'
        post '/sessions', to: 'sessions#create'
        post '/road_trip', to: 'road_trip#create'
      end
    end
  end
