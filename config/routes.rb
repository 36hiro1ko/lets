Lets::Application.routes.draw do
  get "users/new"
  resources :users

  
  resources :sessions, only: [:new, :create, :destroy]
  resources :microposts, only: [:create, :destroy]
  #resources :messages, only: [:create,:destroy,:message_show]
  resources :messages


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
  match '/received_messages', to: 'users#received_messages', via: 'get'
  match '/sent_messages', to: 'users#sent_messages', via: 'get'
  match '/message_show', to: 'messages#message_show', via: 'get'
  #match '/received_message_detail', to: 'messages#received_message_detail', via: 'get'

  #match '/received_message_detail/:id', to: 'messages#received_message_detail', via: 'get'
 get '/received_message_detail/:id',to: 'messages#received_message_detail',as: 'received_message_detail'



end
