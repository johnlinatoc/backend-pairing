Rails.application.routes.draw do
  resources :scheduled_pairs
  resources :pairs
  resources :user_sprints
  resources :sprints
  resources :users
  resources :schedules

  get 'schedules/:id/completed_schedule', to: 'schedules#completed_schedule'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
