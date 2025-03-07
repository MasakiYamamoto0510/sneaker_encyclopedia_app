Rails.application.routes.draw do
  
  devise_for :admins, path: 'admin', skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  }

  namespace :admin do
    get 'dashboards', to: 'dashboards#index'
    resources :customers, only: [:destroy]
  end
 
  scope module: :public do
    devise_for :customers
    root to: 'homes#top'
    get 'homes/about', to: 'homes#about', as: :about
    get '/mypage' => 'customers#mypage', as: 'mypage'
    patch '/mypage' => 'customers#update', as: 'update_mypage'

    get '/customers/:id/unsubscribe' => 'customers#unsubscribe', as: 'unsubscribe'
    patch '/customers/:id/withdrawal' => 'customers#withdrawal', as: 'withdrawal'
    resources :posts do
      resource :favorite, only: [:create, :destroy]
    end
    resources :customers, only: [:show, :edit, :update]
    resources :excavations, only: [:new, :create]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
