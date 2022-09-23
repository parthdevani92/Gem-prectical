Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  resources :comments
  resources :posts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :comments do
    collection do
      match 'search' => 'posts#search', via: [:get, :post], as: :search
    end
  end
  root  to: "gems#list"
  get '/paper_trail', to: 'gems#paper_trail'
  get '/diffy', to: 'gems#diffy'
  get '/deleted/posts', to: 'posts#deleted'
  resources :posts do
    resources :versions, only: [:destroy] do
      member do
        get :diff, to: 'versions#diff'
        patch :rollback, to: 'versions#rollback'
      end
    end
  end

  resources :versions, only: [] do
    member do
      patch :bringback  # <= and that
    end
  end
  

end
