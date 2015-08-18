class Bike_trail < ActiveRecord::Base

  def to_s
    "Bike_trail #{self.name} is in #{self.state}"
  end

end

get '/' do
  @bike_trail = Bike_trail.new
  @bike_trail.name = 'Illinois & Michigan Canal Trail'
  @bike_trail.locale = 'Channahon'
  @bike_trail.state = 'IL'
  @bike_trail.length = 65
  @bike_trail.elev_change = 150
  @bike_trail.save
  Bike_trail.all.to_json
end


get '/api/bike_trails' do

    Bike_trail.all.to_json

end

get '/api/bike_trails/:id' do

    puts params
    Bike_trail.find(params[:id]).to_json

end

post '/api/bike_trails' do
    puts params
    Bike_trail.create({
      :name => params[:name],
      :locale => params[:locale],
      :state => params[:state],
      :length => params[:length],
      :elev_change => params[:elev_change]

      }).to_json
end

patch '/api/bike_trails/:id' do
  bike_trail_args = { :name => params[:name],
    :name => params[:name],
    :locale => params[:locale],
    :state => params[:state],
    :length => params[:length],
    :elev_change => params[:elev_change]
  }

  @bike_trail = Bike_trail.find(params[:id])
  @bike_trail.update(bike_trail_args)
  @bike_trail.to_json

end

put '/api/bike_trails/:id' do
  bike_trail_args = { :name => params[:name],
    :name => params[:name],
    :locale => params[:locale],
    :state => params[:state],
    :length => params[:length],
    :elev_change => params[:elev_change]
  }

  @bike_trail = Bike_trail.find(params[:id])
  @bike_trail.update(bike_trail_args)
  @bike_trail.to_json

end

delete '/api/bike_trails/:id' do
  Bike_trail.destroy(params[:id]).to_json
end
