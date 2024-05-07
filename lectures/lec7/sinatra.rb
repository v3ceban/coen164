# frozen_string_literal: true

require 'sinatra'
require 'sinatra/reloader' # allows to reload dev server

configure do
  set :name, 'Sinatra'
  set :pw, '4rank!'
end

enable :sessions

get '/' do
  @name = 'that automatically refreshes on change!'
  erb :home
end

get '/test' do
  '<h1>Test</h1>' \
  '<a href="/">Home</a>'
end

get '/page' do
  %(
    <html>
      <head>
        <title>Page</title>
      </head>
      <body>
        <h1>Page</h1>
      </body>
    </html>
  )
end

get '/newpage' do
  erb :newpage
end

get '/open_account' do
  erb :open_account
end

get '/currenttime' do
  # query database
  # do calculations
  @time = Time.now # can be accessed in erb template
  erb :currenttime
end

get '/test_route/:x' do
  @value = params[:x]
  erb :test_route
end

get '/guess/:name' do
  @guess = params[:name]
  if @guess == settings.name
    erb :guess
  else
    pass
  end
end

get '/guess/*' do
  @guess = params[:splat]
  erb :guess_wrong
end

get '/bet/:money/on/:number' do
  @money = params[:money].to_i
  @number = params[:number].to_i
  @dice = rand(1..6)
  if @dice == @number
    erb :won
  else
    erb :lost
  end
end

# either come from /login or redirected from /auth
get '/login' do
  erb :login
end

post '/auth' do
  username = params[:username]
  password = params[:password]

  if username == settings.name && password == settings.pw
    erb :account
  else
    # erb :fail
    # @login_fail = true
    session[:login_fail] = true
    redirect '/login' # send a responce back to client with 302 status and go to login page
  end
end
