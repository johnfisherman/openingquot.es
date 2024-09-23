Rails.application.routes.draw do
  # get "site/home",
  get "about", to: "site#about"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  root "quotes#index"

  resources :books
  resources :authors
  resources :quotes

  # Sitemap using sitemap_generator gem
  # get "/sitemap.xml", to: "sitemap#index", defaults: { format: "xml" }

  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"
end
