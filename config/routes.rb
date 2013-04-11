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
  match "contato" => "home#contato"
  match "o-que-cremos" => "home#cremos"
  match "estrutura" => "home#estrutura"
  match "historico" => "home#historico"
  match "estatuto" => "home#estatuto"
  match "regimento" => "home#regimento"
  
  resources :usuarios do
    get 'super', :on => :member
  end

  resources :sessions, :noticias, :paginas, :ministerios, :missionarios, :educacionais, :eventos, :banners, :devocionais
  resources :searches, :path => "buscar"
    
end
