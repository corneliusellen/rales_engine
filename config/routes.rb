Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do 
    namespace :v1 do 

      namespace :merchants do 
        get '/find_all', to: 'search#index'
        get '/random', to: 'search#show'
        get '/find',   to: 'search#show'
        get '/:id/revenue', to: 'reports#revenue'
        get '/:id/favorite_customer', to: 'reports#favorite_customer'
        get '/most_items', to: 'reports#most_items'

      end

      namespace :transactions do 
        get '/find_all', to: 'search#index'
        get '/random', to: 'search#show'
        get '/find',   to: 'search#show'
      end

      namespace :customers do 
        get '/find',   to: 'search#show'
        get '/random', to: 'search#show'
        get '/find_all', to: 'search#index'
        get '/:id/favorite_merchant', to: 'reports#favorite_merchant'
      end

      namespace :items do
        get '/find_all', to: 'search#index'
        get '/find', to: 'search#show'
        get '/random', to: 'search#show'
        get '/:id/best_day', to: 'best_day#show'
      end

      namespace :invoices do
        get '/find_all', to: 'search#index'
        get '/find', to: 'search#show'
        get '/random', to: 'search#show'
      end

      namespace :invoice_items do
        get '/find_all', to: 'search#index'
        get '/find', to: 'search#show'
        get '/random', to: 'search#show'
      end

      resources :items,     only: [:index, :show] do 
        resources :invoice_items, only: [:index], to: 'items/invoice_items#index'
        resources :merchant, only: [:index], to: 'items/merchant#index'
      end

      resources :invoices,     only: [:index, :show] do 
        resources :transactions, only: [:index], to: 'invoices/transactions#index'
        resources :invoice_items, only: [:index], to: 'invoices/invoice_items#index'
        resources :items, only: [:index], to: 'invoices/items#index'
        resources :customer, only: [:index], to: 'invoices/customer#index'
        resources :merchant, only: [:index], to: 'invoices/merchant#index'
      end

      resources :invoice_items,  only: [:index, :show] do
        resources :invoice, only: [:index], to: "invoice_items/invoice#index"
        resources :item, only: [:index], to: "invoice_items/item#index"
      end
      resources :merchants, only: [:index, :show] 
      resources :customers, only: [:index, :show]
      resources :transactions, only: [:index, :show]

    end
  end


end
     

    
      
  