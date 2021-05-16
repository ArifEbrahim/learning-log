require 'socket'
require_relative 'notebook'

# initial code (ex2)
# session = server.accept
# loop do
#   session.puts "What do you say?"
#   they_said = session.gets.chomp
#   while they_said != "quit"
#     session.puts "You said: #{they_said}."
#     session.puts "What do you say?"
#     they_said = session.gets.chomp
#   end
#   session.puts "Goodbye"
#   session.close
# end

# refactored code (ex2)
# session = server.accept
# loop do
#   session.puts "What do you say?"
#   they_said = session.gets.chomp
#   session.close if they_said == "quit"
#   session.puts "You said: #{they_said}."
# end

# code for (ex3)

server = TCPServer.new(2345)
notebook = Notebook.new
session = server.accept
loop do
  session.puts "Do you want to make an entry into the notebook? (Y/N)"
  answer = session.gets.chomp
  notebook.create if answer == "Y"
  session.puts "Do you want to search the notebook? (Y/N)"
  answer = session.gets.chomp
  notebook.search if answer == "Y"
  session.puts "Do you want to quit? (Y/N)"
  answer = session.gets.chomp
  session.close if answer == "Y"
end


 
=begin

Ryan P's solution to JP

require 'socket'
require_relative 'notelist'
server = TCPServer.new(2345)
socket = server.accept
notelist = NoteList.new
num = 0
while num == 0 do
  socket.puts 'What do you say?'
  they_said = socket.gets.chomp
  notelist.add_note(they_said)
  notelist.print_notes 
  if they_said == 'quit'
    socket.close
  end
end
  

  
=end
