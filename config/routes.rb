Rails.application.routes.draw do
  get 'users/new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  get '/home' => 'welcome#index'
  match '/contact',     to: 'contacts#new',             via: 'get'
  resources "contacts", only: [:new, :create]
end
