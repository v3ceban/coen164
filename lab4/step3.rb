# frozen_string_literal: true

require 'erb'

# Create template
template = %q(
 From:  Yuan Wang <ywang6@scu.edu>
 To:  <%= to %>
 Subject:  Midterm
 <%= to[/\w+/] %>:
 Following is the coverage of the midterm exam.
 You will be tested the following areas, especially:
 <%# ignore numerous minor requests -- focus on priorities %>
 <% priorities.each do | priority | %>
        * <%= priority %>
 <% end %>
 Thanks for your patience.
 Yuan Wang
).gsub(/^  /, '')

message = ERB.new(template)

# Set up template data
to = 'coen164 students <coen164class@scu.edu>'
priorities = ['Ruby Class', 'Ruby Modules', 'Ruby Regular Expressions']

# Produce result.
email = message.result
puts email
