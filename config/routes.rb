Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  
  	get '/sign_up' => "users#new"
  	post '/sign_up' => "users#create"

  	get '/sign_in' => "sessions#new"
	post '/sign_in' => "sessions#create"

	get '/sign_out' => "sessions#destroy"  	

	post '/obtain_card' => "monsters#getcard"
	post '/new_deck' => "decks#newdeck"
	get "/auth/:provider/callback" => "sessions#create_from_omniauth"


	get '/search' => "monsters#index"
	post '/search' => "monsters#search"

    root "home#index"
end
