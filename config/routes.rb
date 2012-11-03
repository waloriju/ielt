Ielt::Application.routes.draw do

  get "session/create"
  get "session/destroy"
  get "home/index"

  root :to => 'home#index'
  
  # Login e logout
  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  get "signup" => "usuarios#new", :as => "signup"
  
  match "painel" => "painel#index"
  
  #Paginas estaticas
  match "sobre" => "home#sobre"
  match "nossa-visao" => "home#visao"
  
  resources :sessions, :usuarios, :noticias, :paginas, :ministerios, :missionarios, :educacionais
end
