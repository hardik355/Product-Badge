Rails.application.routes.draw do
  root :to => 'home#index'
  mount ShopifyApp::Engine, at: '/'


  get :charges, to: 'charges#callback'
  get 'user/plans', to: 'plans#index'
  get 'user/plan_create', to: 'plans#create'
  
end
