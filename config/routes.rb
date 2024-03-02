Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  post "webhooks/:source", to: "line#create", as: :line_webhook

  # Defines the root path route ("/")
  # root "articles#index"
end
