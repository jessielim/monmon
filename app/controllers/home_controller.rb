class HomeController < ApplicationController
		skip_before_action :verify_authenticity_token
	def index
		@user = User.find_by(email: cookies[:email])
		if @user.present?
			@deck = Deck.find_by(user_id: @user.id)
		end
	end

	def search
		mon = Monster.find_by(name: params[:name])
	end

	def setnickname
		p "Hey NICKNAME"
	end
end