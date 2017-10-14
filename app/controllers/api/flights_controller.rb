
class Api::FlightsController < ApplicationController

def index
		# require 'unirest'
		# answer = Unirest.post "https://bzmqqvbpgm.localtunnel.me/api/flights?email=ashutosh&password=123456"
		# respond_to do |obj|
		# render json: {status: 'SUCCESS',displayText:'hello', message:'Saved flight', data:answer},status: :ok
		# end
end

def create
	action = params[:action1].to_s
	if action == "signin"

		email = params[:email]
		password = params[:password]
		user = User.where(email: email).first
		if user.nil?
			render json: {status: 'FALIURE',displayText:'signup', message:'user not exist.Please sign up!'},status: :ok
		elsif user.check == password
			user.session_id = SecureRandom.hex
			user.save
			render json: {status: 'SUCCESS',displayText:'hello', message:'SuccessFully Logged in',id:user.session_id},status: :ok
		else
			render json: {status: 'FALIURE',displayText:'wrongpassword', message:'Wrong Password'},status: :ok
		end
	elsif action == "signup"
		email = params[:email]
		password = params[:password]
		phone = params[:phone]
		username = params[:name]
		user = User.where(email:email).first
		if user.nil?
			user = User.new
			user.email = email
			user.check = password
			user.phonenumber = phone
			user.name = username
			user.session_id = SecureRandom.hex
			user.save
			
			render json: {status: 'SUCCESS',displayText:'hello', message:'SuccessFully Signed Up',id:user.session_id},status: :ok

		else
			render json: {status: 'FALIURE',displayText:'userExists', message:'User Already Exists'},status: :ok
		end

	else
		render json: {status: 'FALIURE',displayText:'hello', message:'Please Specify the action'},status: :ok
	end
	
end

end



