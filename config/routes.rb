Rails.application.routes.draw do
  	get 'sessions/new'
	resources :users, :spaces, :appointments, :ratings, format: "json"
end
