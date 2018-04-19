Rails.application.routes.draw do

	resources :users
	resources :statuses
	root "welcome#index"


end
