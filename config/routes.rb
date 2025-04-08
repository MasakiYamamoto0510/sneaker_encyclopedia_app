Rails.application.routes.draw do
  
  devise_for :admins, path: 'admin', skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  }

  namespace :admin do
    get 'dashboards', to: 'dashboards#index'
    get '/dashboards/sneaker', to: 'dashboards#sneaker'
    get '/sneakers/unpublished' => 'sneakers#unpublished', as: 'unpublished'
    get '/sneakers/:id/judge' => 'sneakers#judge', as: 'judge'
    patch '/sneakers/:id/publish' => 'sneakers#publish', as: 'publish'
    resources :customers, only: [:index, :destroy]
    resources :sneakers
    resources :sneaker_brands do
      resources :sneaker_types, only: [:new, :create, :show, :edit, :update, :destroy]
    end
  end
 
  scope module: :public do

    devise_for :customers, skip: [:passwords], controllers: {
      registrations: "public/registrations",
      sessions: 'public/sessions'
    }

    root to: 'homes#top'
    get 'homes/about' => 'homes#about', as: 'about'
    get '/mypage' => 'customers#mypage', as: 'mypage'
    patch '/mypage' => 'customers#update', as: 'update_mypage'
    post '/sneakers/new' => 'sneakers#create'

    get '/customers/:id/unsubscribe' => 'customers#unsubscribe', as: 'unsubscribe'
    patch '/customers/:id/withdrawal' => 'customers#withdrawal', as: 'withdrawal'
    get '/search' => 'sneakers#index'
    post '/search' => 'searches#search'

    resources :posts 
    resources :customers, only: [:show, :edit, :update]
    resources :sneakers, only: [:new, :create, :index, :show] do
      resource :favorite, only: [:create, :destroy]
    end
    resources :sneaker_brands, only: [:index, :show] do
      resources :sneaker_types, only: [:index, :show]
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
