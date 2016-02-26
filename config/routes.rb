Rails.application.routes.draw do
  get 'sessions/new'

  root                  'static_pages#home'
  get 'about'      =>   'static_pages#about'
  get 'help'       =>   'static_pages#help'
  get 'contact_us' =>   'static_pages#contact_us'
  get 'signup'     =>   'users#new'
  get 'login'      =>   'sessions#new'
  post 'login'     =>   'sessions#create'
  delete 'logout'   =>   'sessions#destroy'
  resources :users
  get 'logout'      =>  'static_pages#home'
end