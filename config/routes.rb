Rails.application.routes.draw do
	devise_for :users
	resources :jobs
	resources :charges
	get 'pages/terms'
	get 'pages/about'
	root 'jobs#index'
end
