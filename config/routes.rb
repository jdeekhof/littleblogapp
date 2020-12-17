Rails.application.routes.draw do
	root "welcome#index"
	resources "entries"
	get "contact", to: "welcome#contact"
end
