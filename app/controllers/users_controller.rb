class UsersController < ApplicationController
	def sign

	end

	def sign_in
		@user = User.find_by_email(params[:user][:email])
		# byebug
		if !@user.authenticate(params[:user][:password])
		redirect "/"
		else
		cookies[:email] = params[:user][:email]
		redirect_to "/"
		end 
	end

	def new

	end

	def create
		@user = User.new(first_name: params[:user][:first_name],last_name: params[:user][:last_name],email: params[:user][:email],password: params[:user][:password])
		# byebug
		
		respond_to do |format|
  		if @user.save
  			flash[:notice]
  			format.html { redirect_to '/', notice: 'Account was successfully updated.' }
  		else
  			format.html { render '/', notice: 'An error has occured.' }
  			format.json { render json: @user.errors, status: :unprocessable_entity }
  		end
  		end
	end

	def sign_out
		cookies.clear
		redirect_to '/'
	end
	
end