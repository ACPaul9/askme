Rails.application.routes.draw do

  resources :questions do
    put 'hide', on: :member
  end
  resource :session, only: %i[new create destroy]
  resources :users, param: :nickname, except: %i[index]

  root to: 'questions#index'
end
