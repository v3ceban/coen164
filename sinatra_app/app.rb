# frozen_string_literal: true

require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/contrib'
require 'sinatra/reloader'

configure do
  set :database, { adapter: 'sqlite3', database: 'sqlite3.db' }
  enable :sessions
end

class User < ActiveRecord::Base
  # Define user model here
  # Not sure how though...
end

# Define session score
class Score
  attr_accessor :win, :loss, :profit

  def initialize
    @win = 0
    @loss = 0
    @profit = 0
  end

  def save(user)
    user.total_win += win
    user.total_loss += loss
    user.total_profit += profit
    user.save
  end
end

def start_play_session(user)
  session[:user] = user
  session[:error] = nil
  session[:score] = Score.new
  redirect '/play'
end

get '/' do
  redirect '/play' if session[:user]
  erb :home
end

post '/' do
  user = User.find_by(username: params[:username])

  if params[:login] == 'true'
    if user && user.password == params[:password]
      start_play_session(user)
    elsif user
      session[:error] = 'Wrong password, please try again'
    else
      session[:error] = 'This user does not exist, please sign up or try again'
    end

  elsif params[:signup] == 'true'
    if !user
      user = User.create(username: params[:username], password: params[:password],
                         total_win: 0, total_loss: 0, total_profit: 0)
      start_play_session(user)
    else
      session[:error] = 'This user already exists, please log in'
    end

  elsif params[:logout] == 'true'
    session[:score].save(session[:user])
    session.clear
  end

  redirect '/'
end

get '/login' do
  redirect '/' unless params[:action] && %w[login signup].include?(params[:action])
  @action = params[:action]
  erb :login
end

get '/play' do
  redirect '/' unless session[:user]
  erb :play
end

post '/play/result' do
  redirect '/' unless session[:user]

  bet = params[:bet].to_i
  guess = params[:guess].to_i
  score = session[:score]
  random = rand(1..6)
  result = random == guess

  if result
    score.win += 1
    score.profit += bet * 6
  else
    score.loss += 1
    score.profit -= bet
  end
  redirect "/play?result=#{result}"
end
