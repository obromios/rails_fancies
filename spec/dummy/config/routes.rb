Rails.application.routes.draw do
  resources :bookings
  root to: 'visitors#index'
  get 'visitors/index'
  get 'visitors/fancy_faq_demo'
end
