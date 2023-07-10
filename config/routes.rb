Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  post "/users" => "users#create"
  post "/sessions" => "sessions#create"
  # get "/summoner_infos" => "summoner_infos#index"
  # get "/summoner_infos/:id" => "summoner_infos#show"
  # get "/summoner_infos", controller: "summoner_infos", action: "index"
  resources :summoner_infos
end
