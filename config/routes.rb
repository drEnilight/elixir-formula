require 'sidekiq/web'

Rails.application.routes.draw do
  scope :monitoring do
    Sidekiq::Web.use Rack::Auth::Basic do |username, password|
      ActiveSupport::SecurityUtils.secure_compare(::Digest::SHA256.hexdigest(username), ::Digest::SHA256.hexdigest(ENV["SIDEKIQ_AUTH_USERNAME"])) &
        ActiveSupport::SecurityUtils.secure_compare(::Digest::SHA256.hexdigest(password), ::Digest::SHA256.hexdigest(ENV["SIDEKIQ_AUTH_PASSWORD"]))
    end

    mount Sidekiq::Web, at: '/sidekiq'

    resources :publications, only: %i[index] do
      member do
        post :publish
        post :reject
      end
    end

    root 'publications#index'
  end
end
