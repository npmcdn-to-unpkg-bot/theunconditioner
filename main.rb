require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'pg'

require './db_config'
require './models/user'
require './models/topic'
require './models/card'


enable :sessions

helpers do

def current_user
  User.find_by(id: session[:user_id])
end

def logged_in?
  !!current_user
   #if current user
    #return true
    #else
    #return false
    #@end
  end
end


#HOME PAGE
get '/' do
  erb :index
end


#LOGIN FORM PAGE
get '/session/new' do
  erb :login
  end

#Submitting the login form
post '/session' do
  user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      #we're in! Create a new session. 
      session[:user_id] = user.id
      #redirect (to home)
      redirect to '/' 
        
    else
      #stay at the login form
      erb :login #keeping it to the same page instead of redirecting. 
    end
end


# submitting the log OUT button NOT SURE IF THIS WORKS YET
delete '/session' do
      session[:user_id] = nil
      #redirect (to home)
      redirect to '/' 
    end

#Listing All Topics Page
get '/topics' do
  @topics = Topic.all
  erb :topics
end

#Show a Single Topic Page
get '/topics/:id' do
  
  @single_topic = Topic.find( params[:id] )
  
  #Showing the cards
  @cards = Card.where(topic_id: params[:id])

  erb :topic
end

#User Sign Up Page
get '/users/new' do

  erb :newuser
end

#Submit SignUp Form

post '/users' do

  new_user = User.new 
  new_user.email = params[:email]
  new_user.password = params[:password]
  new_user.save

  redirect to "/"
end

#ALL UNTESTED CODE FROM HERE AS NOT SURE ON DATABASE SET UP

#NEW Profile Page 
get '/user/:id/edit' do
@single_user = User.find(params[:id])
  erb :editprofile
end

#Submit NEW Profile 
post '/users/:id' do #THIS PROB ISN'T RIGHT
  new_profile = Profile.new
  new_profile = Profile.find(params[:id])
  new_profile.name = params[:name]
  new_profile.image_url = params[:image_url]
  new_profile.location = params[:location]
  new_profile.age = params[:age]
  new_profile.save

  redirect to 'profile/:id'
end

#Profile Page Edit
get '/user/:id/edit' do
@single_user = User.find(params[:id]) #not sure if i should get profile.id here?
  erb :editprofile
end

#Submit Profile Edit
#Run The Edit Command
patch '/volcanoes/:id' do
  #udpdate the existing dish
  volcanoe = Volcanoe.find(params[:id])
  volcanoe.name = params[:name]
  volcanoe.image_url = params[:image_url]
  volcanoe.height = params[:height]
  volcanoe.status = params[:status]
  volcanoe.volcanoe_region_id = params[:volcanoe_region_id]
  volcanoe.save

  redirect to '/'
end

#Display Profile Page
get '/user/:id' do

  erb :profile

end



