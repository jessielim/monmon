class MonstersController < ApplicationController
	def getcard
		@user = User.find_by(email: cookies[:email])
		@deck = Deck.find_by(user_id: @user.id)
		@monmon = Monster.new(name: params[:name],spd: params[:spd],spdef: params[:spdef],spatk: params[:spatk],def: params[:def],atk: params[:atk],hp: params[:hp],move1: params[:move1],move2: params[:move2], deck_id: @deck.id)
		respond_to do |format|
            if @monmon.save
                format.html { redirect_to "/" , notice: 'Successfully got a monster card.' }
                format.json 
             else
                format.html { redirect_to "/", notice: 'There are some errors occurred.' }
                format.json
              end
        end
	end

	def index
		@user = User.find_by(email: cookies[:email])
		@deck = Deck.find_by(user_id: @user.id)
		@monster_s = Monster.where(deck_id: @deck.id)
		@monster = Monster.all
	end

	def search
		@user = User.find_by(email: cookies[:email])
		@monster = Monster.all
		if params[:search].present?
			@monster = Monster.search_by_name(params[:search])
			# byebug
			 respond_to do |format|
	          format.html
	          format.json {render json: '/search'}
	          format.js
	         end
		else
			@monster = Monster.all.order("created_at DESC")
		end
	end
end