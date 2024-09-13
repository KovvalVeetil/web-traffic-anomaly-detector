# Rails.application.routes.draw do
#   devise_for :users
#   get 'anomalies/index'
#   get 'anomalies/show'
#   get 'logs/index'
#   get 'logs/show'
#   namespace :admin do
#     # Define routes that will use the Admin::BaseController as their base
#     root to: 'base#index' # This can be adjusted or expanded as needed
#   end
#   # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

#   # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
#   # Can be used by load balancers and uptime monitors to verify that the app is live.
#   get "up" => "rails/health#show", as: :rails_health_check

#   # Defines the root path route ("/")
#   # root "posts#index"
# end
# # namespace :api do
# #   namespace :v1 do
# #     resources :logs, only: [:index, :show]
# #     resources :anomalies, only: [:index, :show]
# #   end
# # end

Rails.application.routes.draw do
  # Admin routes
  namespace :admin do
    root to: 'base#index'  # Placeholder root for admin namespace
    # Add other admin-specific routes as needed
  end

  # API routes for Logs and Anomalies
  resources :logs, only: [:index, :show, :create] do
    collection do
      get 'search'  # Optional: add a search endpoint for logs if needed
    end
  end

  resources :anomalies, only: [:index, :show, :create] do
    collection do
      get 'recent'  # Optional: endpoint for fetching recent anomalies
    end
  end

  # You can define more general routes here

  root 'logs#index' 
end
