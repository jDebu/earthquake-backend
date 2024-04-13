Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  scope '/backend' do
    namespace :api do
      resources :earthquakes
      resources :comments
    end
  end
end