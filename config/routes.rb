Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # On teachers subject page, able to create subject (get+post, new + create)
  # On teachers subject, show my subjects (get, index)
  # On teachers subject, I can edit my subjects (get+patch, show + edit + update)
  # On teachers subject, I can delete my subjects (destroy)
  # filepath will be
  resources :subjects
end
