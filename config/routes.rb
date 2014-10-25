Lets::Application.routes.draw do
  get "users/new"
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :microposts, only: [:create, :destroy]
  resources :message, only: [:index, :create]


  root  'static_pages#home'
  match '/help', to: 'static_pages#help',    via: 'get'
  match '/about', to: 'static_pages#about',   via: 'get'
  match '/home', to: 'static_pages#home', via: 'get'
  match '/sample', to: 'static_pages#sample', via: 'get'
  match '/webfont', to: 'static_pages#webfont', via: 'get'
  match '/contact', to: 'static_pages#contact', via: 'get'

  match '/signup',  to: 'users#new',            via: 'get'
  
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  
  match '/allusers', to: 'users#allusers', via: 'get'
  match '/send_message', to: 'messages#send_message', via: 'get'

  match '/message_box', to: 'users#message_box', via: 'get'


end
