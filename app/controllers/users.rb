#new
# get sign up page
get '/users/new' do
  erb :"users/new"
end

post '/users' do
  user = User.new(params)
  user.password = params[:password_hash]
  user.save
  session[:user_id] = user.id
  redirect '/'
end


delete "/users/:id" do
  User.find_by(id: params[:id]).destroy
  redirect "/"
end

#edit
get '/users/:username/edit' do
  if logged_in?
    @user = User.find_by(username: params[:username])
    erb :'users/edit'
  else
    'quit trying to edit someone elses page!'
  end
end

put '/users/:id' do
  user = User.find_by(id: params[:id])
  user.update_attributes(params[:user])
  user.save
  redirect '/'
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
  else
    'something went wrong. implement error handling'
  end
  redirect '/'
end
