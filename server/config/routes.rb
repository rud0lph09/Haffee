Cafe::Application.routes.draw do
  namespace :api, defaults: {format: :json} do
    namespace :v0 do
      post 'orders', to: 'orders#create'
    end
  end
end
