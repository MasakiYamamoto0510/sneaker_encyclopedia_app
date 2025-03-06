Rails.application.routes.draw do
  
  devise_for :admins, skip: [:registrations, :password]
  namespace :admins do
    get 'dashboards', to: 'dashboards#index'
    resources :customers, only: [:destroy]
  end
 
  devise_for :customers

  root to: "homes#top"
  get 'homes/about' => 'homes#about', as: 'about'
  get '/mypage' => 'customers#mypage', as: 'mypage'
  patch '/mypage' => 'customers#update', as: 'update_mypage'

  get '/customers/:id/unsubscribe' => 'customers#unsubscribe', as: 'unsubscribe'
  patch '/customers/:id/withdrawal' => 'customers#withdrawal', as: 'withdrawal'
  

  resources :posts
  resources :customers, only: [:show, :edit, :update] 
  resource :favorite, only: [:create, :destroy]
  resources :excavations, only: [:new, :create]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
