Rails.application.routes.draw do
  get 'home', to: 'static#home'
  resources :orders
  resources :invoices
  resources :products, only: [:show, :index, :new, :create]
  get '/products/:id/description', to: 'products#description'
  get '/products/:id/inventory', to: 'products#inventory'
  #get '/products/:id/data', to: 'products#data'
  get '/products/:id/product_data', to: 'products#product_data'
end

# Remove the old products/:id/data route and action
# and set products#show to render JSON or HTML
# depending on the format of the request.
