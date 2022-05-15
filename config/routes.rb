Rails.application.routes.draw do
  resources :questions do
    put 'hide', on: :member
  end

  root to: 'questions#index'
end
