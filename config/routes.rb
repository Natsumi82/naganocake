Rails.application.routes.draw do
  namespace :admin do
    get 'search/search'
  end
  # 管理者用
# URL /admin/sign_in ...
  devise_for :admins, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}
  get 'top' => 'homes#top'

  namespace :admin do
     resources :orders, only: [:show,:index]
  end

  namespace :admin do
    resources :customers, only: [:index,:show,:edit]
  end

  namespace :admin do
     resources :genres, only: [:index,:edit]
  end

  namespace :admin do
     resources :items, only: [:index,:new,:show,:edit]
  end

  namespace :admin do
     resources :homes, only: [:top]
  end

   namespace :admin do
      resources :searches, only: [:search]
  end

  # 顧客用
# URL /customers/sign_in ...
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

    scope module: :public do
    root 'homes#top'
  end

  namespace :public do
     resources :addresses, only: [:index,:edit]
  end

  namespace :public do
     resources :orders, only: [:index,:new,:confirm,:coplete,:show]
  end
  namespace :public do
    resources :cart_items, only: [:index]
  end
  namespace :public do
    get 'customers/my_page' => 'customers#show'
    get 'customers/edit'
    get 'customers/unsubscribe'
    get 'customers/withdraw'
  end
  namespace :public do
     resources :items, only: [:index,:show]
  end

  namespace :public do
    get 'homes/top'
    get 'homes/about'
  end





end