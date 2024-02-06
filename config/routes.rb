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
  resources :traits
  resources :units
  resources :performance_traits

  get "/riot_create", controller: "summoner_infos", action: "riot_create"
  # post "/riot_first/:region/:summoner_name", to: "summoner_infos#riot_first" #functional, post requests can be made using post at the proper url e.g. post request to riot_first/na1/Mortdog
  post "/riot_first", to: "summoner_infos#riot_first"
  get "/riot_second", to: "matches#riot_second"
  post "/riot_third", to: "matches#riot_third"
  post "/riot_fourth", to: "match_summoner_performances#riot_fourth"
  get "/profile/:region/:summoner_name", to: "summoner_infos#show_profile"
end
