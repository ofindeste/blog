Rails.application.routes.draw do
  resources :posts
  devise_for :users
  root to: 'posts#index'
  get ':username/posts' => 'home#posts', :as => :user_posts
  mount ActionCable.server => '/cable'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
