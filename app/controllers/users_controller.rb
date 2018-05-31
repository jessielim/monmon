class UsersController < ApplicationController
	# def signin(user)
	# 	cookies[:user_id] = user.id
	# end

	# def sign_in(user)
	# 	@user = User.find_by_email(params[:user][:email])
	# 	# byebug
	# 	if !@user.authenticate(params[:user][:password])
	# 	redirect "/"
	# 	else
	# 	cookies[:email] = params[:user][:email]
	# 	redirect_to "/"
	# 	end 
	# end

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

	# def sign_out
	# 	cookies.clear
	# 	redirect_to '/'
	# end
	
	# def create_from_omniauth
	#   auth_hash = request.env["omniauth.auth"]
	#   authentication = Authentication.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"]) ||  Authentication.create_with_omniauth(auth_hash)

	#   # if: previously already logged in with OAuth
	#   if authentication.user
	#     user = authentication.user
	#     authentication.update_token(auth_hash)
	#     @next = root_url
	#     @notice = "Signed in!"
	#   # else: user logs in with OAuth for the first time
	#   else
	#     user = User.create_with_auth_and_hash(authentication, auth_hash)
	#     # you are expected to have a path that leads to a page for editing user details
	#     # @next = edit_user_path(user)
	#     @notice = "User created. Please confirm or edit details"
	#   end

	#   signin(user)
	#   redirect_to @next, :notice => @notice
	# end
end