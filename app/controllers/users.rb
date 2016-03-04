#new
# get sign up page
get '/users/new' do
  erb :"users/new"
end

post '/users' do
  user = User.new(params)
  user.save
  redirect '/'
end

#edit
get '/users/:username/edit' do
  @user = User.find_by(username: params[:username])
  erb :'users/edit'
end

put '/users/:id' do
  user = User.find_by(id: params[:id])
  user.update_attributes(params[:user])
  user.save
  redirect '/'
end

get "/users/:username" do
  @user = User.find_by(username: params[:username])
  erb :"/users/show"
end

#destroy
# delete my account
# redirect to homepage


# sessions/destroy
# /logout

# sessions/new
#/login
