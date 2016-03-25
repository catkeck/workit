Rails.application.routes.draw do
  root                  'static_pages#home'
  get 'about'      =>   'static_pages#about'
  get 'help'       =>   'static_pages#help'
  get 'contact_us' =>   'static_pages#contact_us'
  get 'signup'     =>   'users#new'
  get 'login'      =>   'sessions#new'
  post 'login'     =>   'sessions#create'
  delete 'logout'   =>   'sessions#destroy'
  get 'friends' => 'users#friends'
  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :microposts,          only: [:create, :destroy]
  resources :friendships
  resources :weights,             only: [:new, :create, :edit, :update]
end