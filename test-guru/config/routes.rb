Rails.application.routes.draw do
  resources :tests , shallow: true do
    resources :questions
  end
end
