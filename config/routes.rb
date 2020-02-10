Rails.application.routes.draw do
  scope :api do
    resources :categories
    post 'authenticate', to: 'authentication#authenticate'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
