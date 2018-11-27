Rails.application.routes.draw do
  #root 'tests#index'
  #resources :tests
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #get '/', to: 'tests#index'
  #get '/tests', to: 'tests#index'
  # /tests/backend/ruby
  #get '/tests/:category/:title', to: 'tests#search', level: 2
  resources :tests do
    resources :questions, shallow: true
  end
end
