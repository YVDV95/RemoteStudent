Rails.application.routes.draw do
	devise_for :users
	resources :jobs
	resources :charges
	get 'pages/index'
	get 'pages/about'
	root 'jobs#index'
end
