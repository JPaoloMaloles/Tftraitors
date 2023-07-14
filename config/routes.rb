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
  resources :matches
  resources :match_summoner_performances

  get "/riot_first", controller: "summoner_infos", action: "riot_create"
  # post "/riot_test/:region/:summoner_name", to: "summoner_infos#riot_test" #functional, post requests can be made using post at the proper url e.g. post request to riot_test/na1/Mortdog
  post "/riot_test", to: "summoner_infos#riot_test"
end
