Rails.application.routes.draw do
  get 'users/new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  get '/home' => 'welcome#index'
  match '/user',     to: 'users#new',             via: 'get'
  resources "users", only: [:new, :create]
end
