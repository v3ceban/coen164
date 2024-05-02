# frozen_string_literal: true

require 'sinatra'

configure do
  set :name, ''
  set :accountID, ''
  set :password, ''
  set :balance, 0
  set :public_folder, "#{File.dirname(__FILE__)}/public"
end

get '/' do
  @name = settings.name
  @balance = settings.balance
  erb :root
end

post '/' do
  settings.name = params[:name] if params[:name] && !params[:name].empty?
  settings.accountID = params[:accountID] if params[:accountID] && !params[:accountID].empty?
  settings.password = params[:password] if params[:password] && !params[:password].empty?

  if params[:deposit] &&
     !params[:deposit].empty? &&
     params[:deposit].to_i.positive?

    settings.balance += params[:deposit].to_i
  end

  if params[:withdraw] &&
     !params[:withdraw].empty? &&
     params[:withdraw].to_i.positive? &&
     settings.balance >= params[:withdraw].to_i

    settings.balance -= params[:withdraw].to_i
  end

  redirect '/'
end

get '/open_account' do
  erb :open_account
end

get '/deposit' do
  if settings.name && !settings.name.empty?
    @balance = settings.balance
    erb :deposit
  else
    redirect '/open_account'
  end
end

get '/withdraw' do
  if settings.name && !settings.name.empty?
    @balance = settings.balance
    erb :withdraw
  else
    redirect '/open_account'
  end
end

get '/logout' do
  settings.name = ''
  settings.accountID = ''
  settings.password = ''
  settings.balance = 0
  redirect '/'
end
