Rails.application.routes.draw do
  root 'home#site'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

    namespace :admin do
      get 'dashboard', to: 'dashboards#show', as: :dashboard
      namespace :real_estate do
        namespace :settings do
          # A rota para index de settings
          resources :settings, only: :index

          namespace :settings do
            resources :property_types, path: 'property_types', only: [:index, :new, :create, :edit, :update, :destroy, :show]
          end
        end
      end
    end




  get "up" => "rails/health#show", as: :rails_health_check
end
