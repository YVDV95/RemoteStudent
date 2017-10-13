Rails.application.routes.draw do
	devise_for :users
	resources :jobs
	resources :charges
	get 'pages/pricing'
	get 'pages/support'
	root 'jobs#index'
	match "/listings", to: "listings#index", :via => 'get'

end
