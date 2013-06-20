Ielt::Application.routes.draw do
  require 'sidekiq/web'
    
  get "session/create"
  get "session/destroy"
  get "home/index"

  root :to => 'home#index'

  # Login e logout
  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  get "signup" => "usuarios#new", :as => "signup"
  
  # Resetar a senha
  get 'sessions/reset' => "sessions#reset"
  match 'reset' => 'sessions#reset_password', :via => :post
  
  match "painel" => "painel#index"

  #Paginas estaticas
  get "sobre/:id" => "home#index", :as => :sobre
  
  resources :usuarios do
    get 'super', :on => :member
  end

  resources :sessions, :noticias, :paginas, :missionarios, :educacionais, :eventos, :banners, :devocionais
  resources :searches, :path => "buscar"
  resources :ministerios, :path => "pastoral"
  resources :contatos, :path_names => { :new => 'novo'}
  
  mount Sidekiq::Web => '/sidekiq'
end
