Rails.application.routes.draw do
  root to: "hairstyle_lists#show", id: 1
  resources :hairstyle_lists, only: :update
end
