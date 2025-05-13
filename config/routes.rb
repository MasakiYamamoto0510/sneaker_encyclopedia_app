Rails.application.routes.draw do
  
  namespace :admin do
    get 'contacts/index'
    get 'contacts/show'
    get 'contacts/destroy'
  end
  devise_for :admins, path: 'admin', skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  }

  namespace :admin do
    get 'dashboards', to: 'dashboards#index'
    get '/dashboards/sneaker', to: 'dashboards#sneaker'
    get '/search' => 'searches#search', as: 'search'

    resources :customers, only: [:show, :index, :destroy]
    resources :posts, only: [:show, :index, :destroy]
    resources :admins, only: [:show, :edit, :update]
    resources :sneakers
    resources :sneaker_comments, only: [:destroy]
    resources :contacts, only: [:index, :show, :destroy] do
      member do
        patch :mark_read
        patch :mark_unread
      end
    end
    resources :sneaker_brands do
      resources :sneaker_types, only: [:new, :create, :show, :edit, :update, :destroy]
    end
  end
 
  scope module: :public do

    devise_for :customers, skip: [:passwords], controllers: {
      registrations: "public/registrations",
      sessions: 'public/sessions'
    }

    devise_scope :customer do
      post "customers/guest_sign_in", to: "sessions#guest_sign_in", as: :customers_guest_sign_in
    end

    root to: 'homes#top'
    get 'homes/about' => 'homes#about', as: 'about'
    get '/mypage' => 'customers#mypage', as: 'mypage'
    patch '/mypage' => 'customers#update', as: 'update_mypage'
    post '/sneakers/new' => 'sneakers#create'

    get '/customers/:id/unsubscribe' => 'customers#unsubscribe', as: 'unsubscribe'
    patch '/customers/:id/withdrawal' => 'customers#withdrawal', as: 'withdrawal'
    get '/search' => 'searches#search', as: 'search'

    resources :posts
    resources :customers, only: [:show, :edit, :update]
    resource :sneaker_comment_favorites, only: [:create, :destroy]
    resources :sneakers, only: [:index, :show] do
      resource :favorite, only: [:create, :destroy]
      resources :sneaker_comments, only: [:create, :destroy]
    end
    resources :sneaker_brands, only: [:index, :show] do
      resources :sneaker_types, only: [:index, :show]
    end

    resources :contacts, only: [:new, :create] do
      collection do
        post 'confirm'
        post 'back'
        get 'done'
      end
    end
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  end 
end
