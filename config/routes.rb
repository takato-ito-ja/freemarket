Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "products#index"
  resources :products, only: [:index, :new, :create,:show, :update, :destroy]
  resources :products, only: [:edit] do
    collection do
      get 'parent'
    end
  end

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
end
