Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "products#index"

  resources :products, only: [:index, :new, :create,:show, :edit, :update, :destroy]

  resources :signups, only: [:new, :show]

  namespace :api do
    resources  controller: :products, only: :child, defaults: { format: 'json' } do
      collection do
        get 'child'
      end
    end
    resources  controller: :products, only: :grand_child, defaults: { format: 'json' } do
      collection do
        get 'grand_child'
      end
    end
    resources  controller: :products, only: :image_destroy, defaults: { format: 'json' } do
      collection do
        delete "image_destroy"
      end
    end
  end

  resources :cards, only: [:new, :show] do
    collection do
      post 'pay', to: 'cards#pay'
      post 'delete', to: 'cards#delete'
    end
  end
  resource "products", only: :show do
    resources :cards, only: :buy do
      collection do
        post "buy", to: "cards#buy"
      end
    end
  end
  resources :buy, only: :show
end
