Rails.application.routes.draw do
  resources :posts, only: [:new, :create, :edit, :update, :show]
  resources :destinations, only: [:show]
  resources :bloggers, only: [:new, :create, :show]
  
  post "/posts/:id/like", to: "posts#like", as: "like"
  
end
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

