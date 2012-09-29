Ielt::Application.routes.draw do
  resources :ministerios

  get "session/create"

  get "session/destroy"

  get "home/index"

  root :to => 'home#index'
  
  # Login and logout
  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  get "signup" => "usuarios#new", :as => "signup"
  
  match "painel" => "painel#index"
  match "sobre" => "home#sobre"
  
  resources :sessions, :usuarios, :noticias, :paginas

end
