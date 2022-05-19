Rails.application.routes.draw do

  resources :questions do
    put 'hide', on: :member
  end
  resource :session, only: %i[new create destroy]
  resources :users, only: %i[new create]

  root to: 'questions#index'
end
