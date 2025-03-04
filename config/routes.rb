Rails.application.routes.draw do
  devise_for :users

  root 'home#index'

  get 'dashboard', to: 'dashboard#index'

  resources :qr_codes do
    member do
      get 'scan'
    end
  end

  resources :restaurants do
    member do
      post 'generate_qr_code'
    end
  end

  # Public scan path for QR codes
  get 'r/:id', to: 'redirects#scan', as: 'redirect_qr_code'

  # Home page
  get 'home/index'
end
