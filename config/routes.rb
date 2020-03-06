Rails.application.routes.draw do
  get 'home/index'
  resources :posts do
    member do
      put 'like', to: "posts#upvote"
      put 'dislike', to: "posts#downvote"
    end
  end
  resources :forums
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "forums#index"

  mount Commontator::Engine => '/commontator'

end
