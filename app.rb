require_relative "config/application"
require "sinatra"
require "sinatra/reloader"
require "sinatra/activerecord"

get "/" do
  @restaurants = Restaurant.all
  erb :home
end

post "/restaurants" do
  @restaurant = Restaurant.new(name: params[:name], address: params[:address])
  @restaurant.save
  redirect to "/"
end

get "/restaurants/new" do
  erb :new
end

get "/restaurants/:id/edit" do
  @restaurant = Restaurant.find(params[:id])
  erb :edit
end

get "/restaurants/:id" do
  @restaurant = Restaurant.find(params[:id])
  erb :show
  # find restaurant and assign to variable
  # display restaurant view
end

put "/restaurants/:id" do
  {"_method"=>"PUT", "name"=>"La Tour d'Argent", "address"=>"15ter Quai de la Tournelle, 75005 Paris", "captures"=>[], "id"=>"5"}
  @restaurant = Restaurant.find(params[:id])
  @restaurant.name = params[:name]
  @restaurant.address = params[:address]
  @restaurant.save
  redirect to "/restaurants/#{@restaurant.id}"
end

delete "/restaurants/:id" do
  restaurant = Restaurant.find(params[:id])
  restaurant.destroy
  redirect to "/"
end

get "/bordeaux" do
  @restaurants = Restaurant.where('address LIKE ?', "%Bordeaux%")
  erb :bordeaux
end

get "/best" do
  @restaurant = Restaurant.order(rating: :desc, name: :asc).first
  redirect to "/restaurants/#{@restaurant.id}"
end
