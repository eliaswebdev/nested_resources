Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'makes#index'

  resources :makes do
    resources :models do
      resources :trims
    end
  end
end
