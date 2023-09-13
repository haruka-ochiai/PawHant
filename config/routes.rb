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
    resources :customers, only: [:index, :show, :edit, :update]
    resources :pet_posts, only: [:index, :destroy]
    resources :comments, only: [:destroy]
    resources :groups, only: [:index, :destroy]
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
      member do
      resources :customer_pets, only: [:new, :create, :edit, :update, :destroy]
      end
      collection do
        get 'check' => 'customers#check'
        delete 'withdraw' => 'customers#withdraw'
      end
    end

      resources :pet_posts, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
      resources :comments, only: [:create, :destroy]
      resource :sightings, only: [:create, :destroy, :index]
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
