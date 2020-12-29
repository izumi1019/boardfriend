Rails.application.routes.draw do
  resources :notifications,only: :update
  get 'notifications/index'
  root 'users#top'
  devise_for :users
  resources :users, :only => [:index, :show]
  resources :messages, :only => [:create]
  resources :rooms, :only => [:create, :show, :index]
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #delete 'posts/:id' => 'posts#destroy' 
  resources :posts do
  get 'posts/:id' => 'posts#show',as: 'post'
  patch 'posts/:id' => 'posts#update'
    resources :participants, :only => [:create, :destroy]
    delete 'cancel' => 'participants#cancel'
    resources :likes, :only=> [:index, :create, :destroy]
  end
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  #devise_for :users, controllers: { registrations: 'users/registrations' }
  get "users/:id/introduce" => "users#introduce"
  get "users/:id/records" => "users#records",as: 'records'
  get "users/:id/likes" => "users#likes",as: 'likes'
  get "users/:id/participants" => "users#participants",as: 'participants'
  #nnget 'registrations/:id/edit' => 'registrations#edit', as:'edit_registrations'
end