Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items do
    resources :orders, only: [:index, :create]
    post '/orders/:item_id', to: 'orders#create'
  end
  

  
end
