Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get 'home/about'=>'homes#about' , as:'about'
  
  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  
  resources :users, only: [:show, :index , :edit, :update]

end
