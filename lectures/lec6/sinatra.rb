# frozen_string_literal: true

require 'sinatra'

get '/' do
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
