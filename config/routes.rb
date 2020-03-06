Rails.application.routes.draw do
  get 'home/index'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  resources :posts do
    member do
      put 'like', to: "posts#upvote"
      put 'dislike', to: "posts#downvote"
    end
  end
  
  resources :forums
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "forums#index"

  mount Commontator::Engine => '/commontator'

end
