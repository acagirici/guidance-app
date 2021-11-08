Rails.application.routes.draw do
  root 'sessions#home'
  get '/signup' => 'users#new'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  delete '/logout' => 'sessions#destroy'

  get '/auth/:provider/callback' => 'sessions#omni_signin'

  resources :students do
    resources :notes
  end

  resources :notes

  resources :users do
    resources :students, shallow: true
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

resources :categories

end
