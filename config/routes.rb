Rails.application.routes.draw do
  resources :user_sprints
  resources :sprints
  resources :users
  resources :schedules
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
