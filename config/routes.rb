Rails.application.routes.draw do
  resources :people
  resources :users
  resources :tickets
  resources :workflows
  resources :projects
end
