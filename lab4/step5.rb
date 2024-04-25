#!/usr/bin/ruby

# frozen_string_literal: true

require 'cgi'
require 'cgi/session'
require 'erb'

cgi = CGI.new('html5')

# Start session
session = CGI::Session.new(cgi, 'session_key' => 'mysession')

@message = if session['visit']
             "You have visited: #{session['visit']} times"
           else
             "You haven't been here recently"
           end

count = (session['visit'] || 0).to_i
count += 1
session['visit'] = count
session.close

@name = cgi.params['name'].first || 'name is empty'
@reason = cgi.params['reason'].first || 'reason is empty'

# this template can technically be moved to a different file (just like in step1)
# but it feels weird to have it there as the script itself is in cgi-bin folder
# which I guess should contain cgi code only. idk
template = ERB.new(<<~ERB)
  <!DOCTYPE html>
  <html lang="en">
  <head>
    <meta charset="UTF-8">
    <title>This is a CGI Program</title>
  </head>
  <body>
    <h1>Your submit from the form:</h1>
    <p>Name: <%= @name %></p>
    <p>Reason: <%= @reason %></p>
    <p><%= @message %></p>
  </body>
  </html>
ERB

cgi.out do
  template.result(binding)
end
