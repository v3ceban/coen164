# frozen_string_literal: true

require 'sinatra'
require 'sinatra/reloader'

configure do
  set :name, 'Sinatra'
  set :pw, '4rank!'
end

enable :sessions

get '/' do
  erb :home
end

post '/' do
  if params[:login] == 'true'
    # do login logic
    # check if database has record > allow
    # else deny and throw error
    params[:username]
  elsif params[:signup] == 'true'
    # do signup logic
    # check if record doesn't exist > create record
    # else throw error
    params[:username]
  else
    redirect '/'
  end
end

get '/login' do
  redirect '/' if !params[:action] || (params[:action] != 'login' && params[:action] != 'signup')
  @action = params[:action]
  erb :login
end
