class HomeController < ApplicationController
		skip_before_action :verify_authenticity_token
	def index
		@user = User.find_by(email: cookies[:email])
		@check = Deck.find_by(user_id: @user.id)
	end

	def getcard
		p "HELOOOOOOOO"
		# byebug
		@monmon = Monster.new(name: params[:name],spd: params[:spd],spdef: params[:spdef],spatk: params[:spatk],def: params[:def],atk: params[:atk],hp: params[:hp],move1: params[:moveset1],move2: params[:moveset2])
		# byebug
		respond_to do |format|
            if @monmon.save
                flash[:notice]
                format.html { redirect_to "/" , notice: 'Successfully got a monster card.' }
                format.json 
             else
                flash[:notice]
                format.html { redirect_to "/", notice: 'There are some errors occurred.' }
                format.json
              end
        end
		
	end
end