Rails.application.routes.draw do
  namespace :admin do
    get 'reports/index'
    get 'reports/show'
  end
  namespace :public do
    get 'reports/new'
  end
  # 会員用
  devise_for :customers, controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions',
  passwords: "public/passwords"
  }


  # 管理者用
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }

  # 管理者側のルーティング
  namespace :admin do
    root to: 'homes#top'
    resources :customers, only: [:index, :show, :edit, :update] do
      member do
        get 'pet_posts', to: 'pet_posts#index_for_customer'
      end
    end
    resources :pet_posts, only: [:index, :show, :destroy]
    resources :comments, only: [:destroy]
    resources :groups, only: [:index, :show, :destroy]
    resources :reports, only: [:index, :show, :update]
    end

  # 検索関係
  resources :searches, only: [:new] do
    collection do
    get 'keyword_search', to: 'searches#keyword_search'
    get 'detail', to: 'searches#detail'
    end
  end

  # ゲストログイン
  devise_scope :customer do
    post "customers/guest_sign_in", to: "customers/sessions#guest_sign_in"
  end

  # 会員側
  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about'
    resources :reports, only: [:new, :create]

    resources :customers, only: [:show, :edit, :update] do
      # リアクションした投稿一覧
      get "sighting_pet_posts", to: "customers#sighting_pet_posts", as: 'customers_sighting_pet_posts'
      resources :customer_pets, only: [:new, :create, :edit, :update, :destroy]
      member do
      # 会員ごとの投稿一覧
      get 'pet_posts', to: 'pet_posts#index_for_customer'
      end
      collection do
        get 'check' => 'customers#check'
        delete 'withdraw' => 'customers#withdraw'
      end
    end

    # 投稿
      resources :pet_posts, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
        member do
        get 'tag_search/:tag_id', action: 'tag_search', as: :tag_search
      end
      resources :comments, only: [:create, :destroy]
      resource :sightings, only: [:create, :destroy]
    end

    # チャット
    resources :rooms, only: [:show, :create]
    resources :messages, only: [:create]
    resources :groups, only: [:index, :show, :edit, :update, :new, :create] do
      resource :group_members, only: [:create, :destroy]
      get "new/mail" => "groups#new_mail"
      get "send/mail" => "groups#send_mail"
    end

    resources :notifications, only: [:index]

  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
