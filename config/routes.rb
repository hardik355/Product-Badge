Rails.application.routes.draw do

  mount ShopifyApp::Engine, at: '/'

  root :to => 'home#index'
  
  get :charges, to: 'charges#callback'
  get 'user/plans', to: 'plans#index'
  get 'user/plan_create', to: 'plans#create'
  
end
