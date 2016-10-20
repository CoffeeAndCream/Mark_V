Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  get '/home' => 'welcome#index'
  get '/login' => 'users#new'
  post '/login/create' => 'users#create'
  post   '/login/signin' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
resources :users
end
