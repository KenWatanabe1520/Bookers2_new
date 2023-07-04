Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users
  get 'home/about' => 'homes#about', as: "about"
  resources :users do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
  resources :books do
    resources :book_comments
    resource :favorites, only: [:create, :destroy]
  end
  get 'search' => "searches#search"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
