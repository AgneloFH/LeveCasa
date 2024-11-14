Rails.application.routes.draw do
  root 'home#site'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  namespace :v1 do
    namespace :real_estate do
      namespace :admin do
        get 'dashboard', to: 'dashboards#show', as: :dashboard
        namespace :settings do
        resource :settings, only: :show, path: '/'
        end
      end
   end
  end



  get "up" => "rails/health#show", as: :rails_health_check
end
