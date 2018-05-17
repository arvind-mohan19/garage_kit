Rails.application.routes.draw do
  	get 'sessions/new'
	resources :users, :spaces, :appointments, :ratings, format: "json"
	post 'users/verify_phone_number'
end
