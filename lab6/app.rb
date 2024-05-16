# frozen_string_literal: true

require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

configure do
  set :database, { adapter: 'sqlite3', database: 'books.db' }
end

class Book < ActiveRecord::Base
  # Define your book model here
end

get '/' do
  @books = Book.all
  erb :index
end

post '/books' do
  Book.create(params[:book])
  redirect '/'
end

get '/books/new' do
  erb :new_book
end

post '/books/delete/:id' do
  book = Book.find(params[:id])
  book.destroy
  redirect to('/')
end
