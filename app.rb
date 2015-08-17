require 'bundler'
Bundler.require

ActiveRecord::Base.establish_connection(
  :adapter => 'postgresql',
  :database => 'restfulcats'
)

get '/' do
  cat = Cat.create({:name => 'Pueni', :breed => 'Sofacat'}).to_json

  # @cat = Cat.new
  # @cat.name = "Lueni"
  # @cat.breed = "Alleycat"
  # @cat.save
  # @cat.to_json
end

## Now to build the RESTful API

# GET: List
get '/api/cats' do
  Cat.all.to_json
end

# GET: By id
get '/api/cats/:id' do
  puts params
  Cat.find(params[:id]).to_json
end

# POST: new record targets the same URL as GET List, but we can change the method to POST on CocoaREST
# API allows direct access to the database without all the usual forms
post '/api/cats' do
  puts params
  Cat.create({:name => params[:name], :breed => params[:breed]}).to_json
end

# Update a record by id
patch '/api/cats/:id' do
  cat_args = { :name => params[:name], :breed => params[:breed] }
  # this is similar to strong params in Rails
  # params.require(:cat).permit(:name,:breed)
  @cat = Cat.find(params[:id])
  @cat.update(cat_args)
  @cat.to_json

end

put '/api/cats/:id' do
  cat_args = { :name => params[:name], :breed => params[:breed] }
  # this is similar to strong params in Rails
  # params.require(:cat).permit(:name,:breed)
  @cat = Cat.find(params[:id])
  @cat.update(cat_args)
  @cat.to_json

end

delete '/api/cats/:id' do
  Cat.destroy(params[:id]).to_json
end
