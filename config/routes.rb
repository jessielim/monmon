Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  	# get '/sign_in' => "users#new"
  	get '/sign_up' => "users#new"
  	post '/sign_up' => "users#create"
  	get '/sign_in' => "users#sign"
	post '/sign_in' => "users#sign_in"
	get '/sign_out' => "users#sign_out"  	
	post '/obtain_card' => "home#getcard"
	post '/new_deck' => "decks#newdeck"
    root to: "home#index"
end
