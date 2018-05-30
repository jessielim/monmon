class DecksController < ApplicationController
	def newdeck
		
		@user = User.find_by(email: cookies[:email])
		@deck = Deck.new(name: params[:name], user_id: @user.id)
		byebug
		respond_to do |format|
            if @deck.save
                  flash[:notice]
                format.html { redirect_to "/" , notice: 'Deck created successfully.' }
                format.json 
             else
                  flash[:notice]
                format.html { redirect_to "/", notice: 'There are some errors occurred.' }
                format.json
              end
        end
	end

	def savedeck
		
	end
end