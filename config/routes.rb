Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/", to: "menu#index", as: "root"
  post "/create", to: "menu#create"
  get "/show/:id", to: "menu#show", as: "show"

end
