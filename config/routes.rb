Rails.application.routes.draw do
  devise_for :customers

  root to: "homes#top"
  get 'homes/about' => 'homes#about', as: 'about'
  resources :posts
  resources :customers, only: [:show, :edit, :update]
  get '/mypage' => 'customers#mypage', as: 'mypage'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
