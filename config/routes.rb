Ielt::Application.routes.draw do
  get "home/index"

  root :to => 'home#index'
  resources :usuarios

end
