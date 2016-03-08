Rails.application.routes.draw do
  root to: 'visitors#index'
  get 'visitors/index'
  get 'visitors/fancy_faq_demo'
end
