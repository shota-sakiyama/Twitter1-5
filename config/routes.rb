Rails.application.routes.draw do
  root 'twitters#index', as: 'home'
  resources :twitters
  resources :twitters do
    collection do
      post :confirm
    end
  end
end
