
class Api::FlightsController < ApplicationController

def index
flights=Flight.all
render json: {status: 'SUCCESS',displayText:'hello', message:'Saved flight', data:flights},status: :ok

end

def create


response=""
context = []
if params[:result][:action]=="flight"
	from=params[:result][:parameters][:location_from]
	to=params[:result][:parameters][:location_to]
	@result=Flight.where(location_from:from,location_to:to)
	results=""
	i=1
		@result.each do |obj|
		results=results+i.to_s+". "+obj.departure_time.to_s+" "+obj.duration.to_s+" "+obj.price.to_s
		i=i+1
		end
	response="flight available for: "+results
elsif params[:result][:action]=="bookflight"
	from=params[:result][:contexts][0][:parameters][:location_from]
	to=params[:result][:contexts][0][:parameters][:location_to]
	choice=params[:result][:parameters][:number].to_i
	@result=Flight.where(location_from:from,location_to:to)
	response="flight booked details: "+@result[choice-1].departure_time.to_s+" "+@result[choice-1].price.to_s
	booked=BookedFlight.new
	booked.flight_id=@result[choice-1].id
	booked.session_id=params[:sessionId]
	booked.save
elsif params[:result][:action]=="bookedflight"
	check=BookedFlight.where(session_id:params[:sessionId])
	check_ids=[]
		check.each do |obj|
		check_ids << obj.flight_id
		end
	results=""
	if check.length>0
	flight=Flight.where(id:check_ids)
	i=1
		flight.each do |obj|
		results=results+i.to_s+". "+" "+obj.location_from+" "+obj.location_to+obj.departure_time.to_s+" "+obj.duration.to_s+" "+obj.price.to_s
		i=i+1
		end
	response="your booked flights are: "+results

	end
elsif params[:result][:action]=="username"
	if not (User.where(session_id:params[:sessionId]).length>0)	
		context[0] = {"name":"entername","lifespan":1}
		response = "Hello,Could you please tell me your name?"

	else
		response = "Hi, "+User.where(session_id:params[:sessionId]).first.name
	end

elsif params[:result][:action]=="enterusername"
	 user = User.new
	 user.name = params[:result][:parameters]["given-name"]
	 user.session_id=params[:sessionId]
	 user.save
	 response="Nice to meet you, "+user.name
end

result1 = {}
result1["speech"] = response
result1["displayText"] = response
result1["data"] = {}
result1["contextOut"] = context
result1["source"] = "Rails server"
respond_to do |format|
    format.json { render json: result1 }
  end
end	



private

def flight_params
params.permit(:location_from,:location_to,:boarding_time,:departure_time,:gate_number)
end

  def make_post_req
	require 'open-uri'
	require 'rexml/document'
	require 'net/http'
	
	# include REXML

	url = URI.parse('https://s7.arms.aero/VISTARA/GetFlightsForCMS/CMSService.asmx?GetFlightsForCMS')
		params = { :FlightDate => "8 oct" }
		# url = 'https://s7.arms.aero/VISTARA/GetFlightsForCMS/CMSService.asmx?GetFlightsForCMS')
		params = { :FlightDate => "8 oct" }
		req = Net::HTTP::Get.new(url.to_s)
		res = Net::HTTP.start(url.host, url.port) {|http|
  		http.request(req)
		}
puts res.body


end

end



