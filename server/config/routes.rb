Cafe::Application.routes.draw do
  namespace :api, defaults: {format: :json} do
    namespace :v0 do
      post 'orders', to: 'orders#create'
      post 'orders/feedback'
      get 'orders', to: 'orders#index'
      get 'orders/search', to: 'orders#search'
    end
  end
end
