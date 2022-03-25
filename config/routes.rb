Rails.application.routes.draw do

  # Sidekiq
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'


  mount ShopifyApp::Engine, at: '/'
  
  root :to => 'home#index'
	
	# CHARGE AND PLANS ROUTES  
  get :charges, to: 'charges#callback'
  get 'user/plans', to: 'plans#index'
  get 'user/plan_create', to: 'plans#create'


  # post '/webhooks/uninstalled', :to => 'custom_webhooks#uninstalled'
  # post '/webhooks/app_install', :to => ''
  
end
