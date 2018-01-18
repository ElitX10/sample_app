Rails.application.routes.draw do
  resource :sessions, :only => [:new, :create, :destroy]

  get 'signup' => 'cats#new'
  get 'signin' => 'sessions#new'
  get 'signout' => 'sessions#destroy'
  resources :cats

  #pages :
  root 'pages#home'
  get '/contact' => 'pages#contact'
  get '/about' => 'pages#about'
  get '/help' => 'pages#help'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
