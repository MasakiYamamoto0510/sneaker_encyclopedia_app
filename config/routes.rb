Rails.application.routes.draw do
  
  
  devise_for :admins, path: 'admin', skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  }

  namespace :admin do
    get 'dashboards', to: 'dashboards#index'
    get '/sneakers/unpublished' => 'sneakers#unpublished', as: 'unpublished'
    get '/sneakers/:id/judge' => 'sneakers#judge', as: 'judge'
    patch '/sneakers/:id/publish' => 'sneakers#publish', as: 'publish'
    resources :customers, only: [:index, :destroy]
    resources :sneakers
    resources :sneaker_brands, only: [:new, :create, :index, :edit, :update, :destroy]
    resources :sneaker_types, only: [:new, :create, :index, :edit, :update, :destroy]
  end
 
  scope module: :public do
    devise_for :customers
    root to: 'homes#top'
    get 'homes/about', to: 'homes#about', as: :about
    get '/mypage' => 'customers#mypage', as: 'mypage'
    patch '/mypage' => 'customers#update', as: 'update_mypage'
    post '/sneakers/new', to: 'sneakers#create'

    get '/customers/:id/unsubscribe' => 'customers#unsubscribe', as: 'unsubscribe'
    patch '/customers/:id/withdrawal' => 'customers#withdrawal', as: 'withdrawal'
    resources :posts do
      resource :favorite, only: [:create, :destroy]
    end
    resources :customers, only: [:show, :edit, :update]
    resources :sneakers, only: [:new, :create, :index, :show]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
