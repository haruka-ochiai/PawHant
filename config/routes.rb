Rails.application.routes.draw do
  # 会員用
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
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
    end

  resources :searches, only: [] do
  get 'keyword_search', on: :collection
end

  # ゲストログイン
  devise_scope :customer do
    post "customers/guest_sign_in", to: "customers/sessions#guest_sign_in"
  end

  # 会員側のルーティング
  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about'

    resources :customers, only: [:show, :edit, :update] do
      get "sighting_pet_posts", to: "customers#sighting_pet_posts", as: 'customers_sighting_pet_posts'
      member do
      resources :customer_pets, only: [:new, :create, :edit, :update, :destroy]
      get 'pet_posts', to: 'pet_posts#index_for_customer'
      end
      collection do
        get 'check' => 'customers#check'
        delete 'withdraw' => 'customers#withdraw'
      end
    end

      resources :pet_posts, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
        member do
        get 'tag_search/:tag_id', action: 'tag_search', as: :tag_search
      end
      resources :comments, only: [:create, :destroy]
      resource :sightings, only: [:create, :destroy]
    end

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
