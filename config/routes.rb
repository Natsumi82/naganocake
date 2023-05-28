Rails.application.routes.draw do
  namespace :admin do
    get 'search/search'
  end
  # 管理者用
# URL /admin/sign_in ...
  devise_for :admins, controllers: {
  sessions: "admin/sessions"
}
  get 'top' => 'homes#top'
  namespace :admin do
    get 'orders/show'
  end
  namespace :admin do
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
  end
  namespace :admin do
    get 'genres/index'
    get 'genres/edit'
  end
  namespace :admin do
    get 'items/index'
    get 'items/new'
    get 'items/show'
    get 'items/edit'
  end
  namespace :admin do
    get 'homes/top'
  end

   namespace :admin do
    get 'searches/search'
  end

  # 顧客用
# URL /customers/sign_in ...
  devise_for :customers, controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

    scope module: :public do
    root 'homes#top'
  end

  namespace :public do
    get 'addresses/index'
    get 'addresses/edit'
  end
  namespace :public do
    get 'orders/new'
    get 'orders/comfirm'
    get 'orders/complete'
    get 'orders/index'
    get 'orders/show'
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
    get 'items/index'
    get 'items/show'
  end
  namespace :public do
    get 'homes/top'
    get 'homes/about'
  end





end