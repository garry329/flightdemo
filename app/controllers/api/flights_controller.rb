
class Api::FlightsController < ApplicationController

def index
flights=Flight.all
render json: {status: 'SUCCESS',displayText:'hello', message:'Saved flight', data:flights},status: :ok
end

def create
flight=Flight.new(flight_params)
if flight.save
          render json: {status: 'SUCCESS', message:'Saved flight', data:flight},status: :ok
        else
          render json: {status: 'ERROR', message:'flight not saved', data:flight.errors},status: :unprocessable_entity
        end
end	

def show
        flight = Flight.find(params[:id])
        render json: {status: 'SUCCESS', message:'Loaded article', data:flight},status: :ok
      end
def flight


end
private

def flight_params
params.permit(:location_from,:location_to,:boarding_time,:departure_time,:gate_number)
end

end



