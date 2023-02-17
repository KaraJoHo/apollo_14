Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/astronauts", to: "astronauts#index"
  get "/astronauts/:astronaut_id", to: "astronauts#show"

  post "/astronaut_missions/:astronaut_id", to: 'astronaut_missions#create'
end
