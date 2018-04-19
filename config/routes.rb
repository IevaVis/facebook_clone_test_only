Rails.application.routes.draw do

	resources :users
	resources :statuses
	root "welcome#index"

	get "/sign_in" => "sessions#new", as: "sign_in"
	post "sign_in" => "sessions#create"
  	delete "/sign_out" => "sessions#destroy", as: "sign_out"
  	post "like" => "likes#create"
  	delete "/delete_like" => "likes#destroy"


end
