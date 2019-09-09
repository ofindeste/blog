Rails.application.routes.draw do
  resources :posts
  devise_for :users
  root to: 'posts#index'
  get ':username/posts' => 'home#posts', :as => :user_posts
  get ':username/digests' => 'home#digests', :as => :user_digests
  post 'posts/:id/comment' => 'posts#add_comment', :as => :comment
  scope "/admin" do
    resources :users
  end
  mount ActionCable.server => '/cable'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
