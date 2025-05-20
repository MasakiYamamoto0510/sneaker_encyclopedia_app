Rails.application.routes.draw do
  # --　管理者用ルーティング　--------------------------------------------------------------
  devise_for :admins, path: 'admin', skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  }

  namespace :admin do
    # ダッシュボード
    get 'dashboards', to: 'dashboards#index'
    get 'dashboards/sneaker', to: 'dashboards#sneaker'
    get 'search', to: 'searches#search', as: 'search'

    # リソース
    resources :customers, only: [:index, :show, :destroy]
    resources :posts, only: [:index, :show, :destroy]
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

  # -- 一般ユーザー用ルーティング ----------------------------------------------------------------
  scope module: :public do
    # Devise（Customer）
    devise_for :customers, skip: [:passwords], controllers: {
      registrations: "public/registrations",
      sessions: 'public/sessions'
    }

    devise_scope :customer do
      post 'customers/guest_sign_in', to: 'sessions#guest_sign_in', as: :customers_guest_sign_in
    end

    # 静的ページ
    root to: 'homes#top'
    get 'homes/about', to: 'homes#about', as: 'about'

    # マイページ
    get 'mypage', to: 'customers#mypage', as: 'mypage'
    patch 'mypage', to: 'customers#update', as: 'update_mypage'

    # 退会関連
    get 'customers/:id/unsubscribe', to: 'customers#unsubscribe', as: 'unsubscribe'
    patch 'customers/:id/withdrawal', to: 'customers#withdrawal', as: 'withdrawal'

    # 検索
    get 'search', to: 'searches#search', as: 'search'

    # 投稿
    resources :posts

    # 顧客
    resources :customers, only: [:show, :edit, :update]

    # スニーカー
    resources :sneakers, only: [:index, :show, :create] do
      resource :favorite, only: [:create, :destroy]
      resources :sneaker_comments, only: [:create, :destroy]
    end

    # コメントのお気に入り
    resource :sneaker_comment_favorites, only: [:create, :destroy]

    # ブランド・タイプ
    resources :sneaker_brands, only: [:index, :show] do
      resources :sneaker_types, only: [:index, :show]
    end

    # お問い合わせ
    resources :contacts, only: [:new, :create] do
      collection do
        post 'confirm'
        post 'back'
        get 'done'
      end
    end
  end
end
