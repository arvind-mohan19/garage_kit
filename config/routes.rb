Rails.application.routes.draw do
  get 'sessions/new'

	resources :users, :spaces, :appointments, :ratings, format: "json"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	get "/verify" => 'verify#new', as: 'new_verify'
	put '/verify' => 'verify#update', as: 'verify'
	post '/verify' => 'verify#create', as: 'resend_verify'
end
