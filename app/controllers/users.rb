#new
# get sign up page
get '/users/new' do
  erb :"users/new"
end

post '/users' do
  user = User.new(params)
  user.password = params[:password_hash]
  if user.save
    session[:user_id] = user.id
    redirect '/'
  else
    @errors = user.errors.full_messages
    erb :'users/new'
  end
end


delete "/users/:id" do
 @user = User.find_by(id: params[:id])
  if logged_in? && @user.id == session[:user_id]
    @user.destroy
    redirect "/"
  else
    @no_access = "You do not have access"
    erb :index
  end
end

#edit
get '/users/:username/edit' do
  @user = User.find_by(username: params[:username])
  if logged_in? && @user.id == session[:user_id]
    erb :'users/edit'
  else
    @no_access = "You do not have access"
    erb :index
  end
end

put '/users/:id' do
  @user = User.find_by(id: params[:id])
  if logged_in? && @user.id == session[:user_id]
    user = User.find_by(id: params[:id])
    user.update_attributes(params[:user])
    user.save
    redirect '/'
  else
    @no_access = "You do not have access"
    erb :index
  end
end

#show
get "/users/:username" do
  @user = User.find_by(username: params[:username])
  erb :"/users/show"
end

get '/logout' do
  session.clear
  redirect '/'
end

# sign in
# new

get '/login' do
  erb :'/sessions/new'
end

post '/login' do
  user = User.find_by(username: params[:username])
  if user && user.password == params[:password_hash]
    session[:user_id] = user.id
    redirect '/'
  else
    @error = "something went wrong. please try again"
    erb :'/sessions/new'
  end
end
