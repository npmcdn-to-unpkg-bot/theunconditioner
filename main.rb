require 'sinatra'
require 'pg'

require './db_config'
require './models/user'
require './models/topic'
require './models/card'
require './models/complete'

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
      redirect to '/topics' 
        
    else
      #stay at the login form
      erb :login #keeping it to the same page instead of redirecting. 
    end
end


# submitting the log OUT button
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

  redirect to "/session/new"
end

#Show Profile Page 
get '/users/:id' do
  @single_user = User.find(params[:id])

  topics_completed = Complete.where(user_id: params[:id])

  @topics = Array.new

    topics_completed.each do |complete|

      @topics.push(Topic.find(complete[:topic_id]))      
    end

  erb :profile
end

#Submit Finished Topic Btn 
 
post '/completes' do
  # topic = Topic.find(params[:topic_id])

  new_complete = Complete.new
  new_complete.topic_id = params[:topic_id]
  new_complete.user_id = current_user.id
  new_complete.save

  redirect to "/completes/#{new_complete.id}"
  # redirect to "/topic/:id/complete"
end

#success Page
get '/completes/:id' do
  erb :completed_report
end

#Leaderboard
get "/leaderboard" do

  @users = User.all
  @results = Array.new
    @users.each do |user|

      total = Complete.where(user_id: user.id).count
      @results.push([user.email, total])
    end   

  erb :leaderboard
end



