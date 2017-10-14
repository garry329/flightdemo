class Api::UsersController < ApplicationController

	def index
	username = params[:email]
	password = params[:password]
	user = User.where(email: username).first
	if user.nil?
		render json: {status: 'SUCCESS',displayText:'hello', message:'user not exist.Please sign up!'},status: :ok
	elsif user.check == password
		render json: {status: 'SUCCESS',displayText:'hello', message:'SuccessFully Logged in'},status: :ok
	else
		render json: {status: 'Falire',displayText:'hello', message:'Wrong Password'},status: :ok
	end
	
	end

end