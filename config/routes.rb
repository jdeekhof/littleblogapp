Rails.application.routes.draw do
	root "welcome#index"
	devise_for :admins
	resources :admins
	resources "entries"
	get "about", to: "welcome#about"
end
