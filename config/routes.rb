Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end
  root to: 'users#index'
  get '/calendar', to: 'pages#calendar'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :schedules, only: %i[index new create edit]
  resources :availabilities, only: %i[new create]

  # As a teacher, I can view and edit bookings to update them
  # As a teacher I can delete my bookings history
  # As a student, I can view, create and update bookings
  # For student, booking routes shld be nested under teachers availability page
  resources :bookings, only: %i[index edit update]
  resources :subjects
  resources :users, only: %i[index show] do
    resources :bookings, only: %i[new create]
  end

  # User has many subjects
  # User has many bookings
  # subject belongs to user
  # Subject has many bookings
  # Booking belongs to user
  # Booking has one subject
end
