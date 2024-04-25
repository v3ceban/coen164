#!/usr/bin/ruby

# frozen_string_literal: true

require 'cgi'
require 'cgi/session'
require 'erb'

cgi = CGI.new('html5')

# Start session
session = CGI::Session.new(cgi, 'session_key' => 'mysession')

message = if session['visit']
            "You have visited: #{session['visit']} times"
          else
            "You haven't been here recently"
          end

count = (session['visit'] || 0).to_i
count += 1

session['visit'] = count

session.close

p1 = if cgi.params['name'] == ''
       cgi.params['name']
     else
       'name is empty'
     end

p2 = if !cgi.params['reason'].empty?
       cgi.params['reason']
     else
       'reason is empty'
     end

# this template can technically be moved to a different file
# but it feels weird to have it there as the script itself is in cgi-bin folder
# that I guess should contain cgi code only. idk
template = ERB.new(<<~ERB)
  <!DOCTYPE html>
  <html lang="en">
  <head>
    <meta charset="UTF-8">
    <title>This is a CGI Program</title>
  </head>
  <body>
    <h1>Your submit from the form:</h1>
    <p>Name: <%= p1 %></p>
    <p>Reason: <%= p2 %></p>
    <p><%= message %></p>
  </body>
  </html>
ERB

cgi.out do
  template.result(binding)
end
