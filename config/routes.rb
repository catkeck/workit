Rails.application.routes.draw do
  root                  'static_pages#home'
  get 'about'  =>       'static_pages#about'
  get 'help'  =>        'static_pages#help'
  get 'contact_us' =>   'static_pages#contact_us'
  get 'login' =>        'static_pages#login'
end