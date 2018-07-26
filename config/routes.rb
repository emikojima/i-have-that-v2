Rails.application.routes.draw do
  resources :categories
  resources :reviews
  resources :users, except:[:show]
  resources :users, only:[:show] do
    resources :items, only:[:show, :index, :new, :edit, :create, :update, :destroy]

  end
  root to: 'static#welcome'
  get '/items', to: 'items#all'
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  get '/logout', to: 'users#destroy'
  post '/logout', to: 'users#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
