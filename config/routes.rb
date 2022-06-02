Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end
  root to: 'pages#home'
  get '/calendar', to: 'pages#calendar'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :schedules, only: %i[new create edit]
  resources :availabilities, only: %i[new create]

  # As a teacher, I can view and edit bookings to update them
  # As a teacher I can delete my bookings history
  # As a student, I can view, create and update bookings
  # For student, booking routes shld be nested under teachers availability page
  resources :bookings, only: %i[index new create edit update]
  resources :subjects
  resources :users, only: [:show]
end
