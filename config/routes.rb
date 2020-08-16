require 'sidekiq/web'

Rails.application.routes.draw do
  scope :monitoring, module: 'admin', constraints: AdminUserConstraint.new do
    mount Sidekiq::Web, at: '/sidekiq'

    resources :publications, only: %i[index] do
      member do
        post :publish
        post :reject
      end
    end

    root 'publications#index', as: :admin_root
  end

  root 'publications#index'

  # session
  get '/auth/:provider/callback', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy'
end
