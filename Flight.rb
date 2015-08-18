class Flight < ActiveRecord::Base

  def to_s
    "Flight number #{self.id} is bound for #{self.destination}"
  end

end

# get '/' do
#   @flight = Flight.new
#   @flight.flight_number = 'N83MZ'
#   @flight.airline = 'American Airlines'
#   @flight.aircraft = 'Airbus A321'
#   @flight.origin = 'MIA'
#   @flight.destination = 'DFW'
#   @flight.altitude = 34000
#   @flight.ground_speed = 445
#   @flight.latitude = 25.8055
#   @flight.longitude = -80.2386
#   @flight.save
#   Flight.all.to_json
#
# end

get '/api/flights' do

  Flight.all.to_json

end

get '/api/flights/:id' do

  puts params
  Flight.find(params[:id]).to_json

end

post '/api/flights' do
  puts params
  Flight.create({
    :flight_number => params[:flight_number],
    :airline => params[:airline],
    :aircraft => params[:aircraft],
    :origin => params[:origin],
    :destination => params[:destination],
    :altitude => params[:alititude],
    :ground_speed => params[:ground_speed],
    :latitude => params[:latitude],
    :longitude => params[:longitude]
    }).to_json

end

patch '/api/flights/:id' do
  flight_args = {
    :flight_number => params[:flight_number],
    :airline => params[:airline],
    :aircraft => params[:aircraft],
    :origin => params[:origin],
    :destination => params[:destination],
    :altitude => params[:alititude],
    :ground_speed => params[:ground_speed],
    :latitude => params[:latitude],
    :longitude => params[:longitude]
    }

    @flight = Flight.find(params[:id])
    @flight.update(flight_args)
    @flight.to_json

end

put '/api/flights/:id' do
  flight_args = {
    :flight_number => params[:flight_number],
    :airline => params[:airline],
    :aircraft => params[:aircraft],
    :origin => params[:origin],
    :destination => params[:destination],
    :altitude => params[:alititude],
    :ground_speed => params[:ground_speed],
    :latitude => params[:latitude],
    :longitude => params[:longitude]
    }

    @flight = Flight.find(params[:id])
    @flight.update(flight_args)
    @flight.to_json

end

delete '/api/flights/:id' do
  Flight.destroy(params[:id]).to_json
end
