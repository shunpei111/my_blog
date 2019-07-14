Rails.application.routes.draw do
  
  devise_for :users
  resources :users, only: :show do 
    resources :posts, expect: :index 
  end
  resources :posts, only: :index 
  root 'posts#index'
  # 最初のとっぷページを決めれる
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
