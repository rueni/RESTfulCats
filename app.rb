require 'bundler'
Bundler.require

ActiveRecord::Base.establish_connection(
  :adapter => 'postgresql',
  :database => 'restfulcats'
)

# Get all cats
get '/' do
  Cat.new
  Cat.name = "Lueni"
  Cat.breed = "alleycat"
  Cat.save
  Cat.to_json
end
