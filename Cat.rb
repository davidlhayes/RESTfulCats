class Cat < ActiveRecord::Base

  def to_s
    "Cat number #{self.id} with a name of #{self.name} and is a #{self.breed}"
  end


end


# does our model and sinatra work? let's see...
# get '/' do
#   @cat = Cat.new
#   @cat.name = 'Bidala'
#   @cat.breed = 'persian'
#   @cat.save
#   cat.to_json
# end

get '/api/cats' do

  Cat.all.to_json

end

get '/api/cats/:id' do

  puts params
  Cat.find(params[:id]).to_json

end

post '/api/cats' do
    puts params
    Cat.create({
      :name => params[:name],
      :breed => params[:breed]
      }).to_json
end

# PATCH: Update by ID (NEVER update the ID of an existing record)

patch '/api/cats/:id' do
  cat_args = { :name => params[:name], :breed => params[:breed] }

  @cat = Cat.find(params[:id])
  @cat.update(cat_args)
  @cat.to_json

end

# put or patch not supported everywhere
put '/api/cats/:id' do
  cat_args = { :name => params[:name], :breed => params[:breed] }

  @cat = Cat.find(params[:id])
  @cat.update(cat_args)
  @cat.to_json

end

delete '/api/cats/:id' do
  Cat.destroy(params[:id]).to_json
end
