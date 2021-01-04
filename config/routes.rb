Rails.application.routes.draw do
  devise_for :admins
	root "welcome#index"
	resources "entries"
	get "contact", to: "welcome#contact"
end
