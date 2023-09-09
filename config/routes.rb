Rails.application.routes.draw do
  namespace :public do
    get 'pet_posts/index'
    get 'pet_posts/show'
    get 'pet_posts/new'
    get 'pet_posts/edit'
  end
  namespace :public do
    get 'customers_pets/new'
    get 'customers_pets/edit'
  end
  namespace :public do
    get 'customers/show'
    get 'customers/edit'
  end
  namespace :public do
    get 'homes/top'
    get 'homes/about'
  end
  # 会員用
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }

  # 管理者用
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
