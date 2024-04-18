# frozen_string_literal: true

# BasicObject is a superclass of Kernel which is a superclass of Object
# IO is a subclass of Object
# File is a subclass of IO, BasicSocket is a subclass of IO
#
# class Object < BasicObject
#   includes Kernel
# end
#
# Kernel Methods
#
# gets - reads 1 line
# print "Enter your name"
# n = gets
# puts "your name is #{n}"
#
# readline is the same as gets
# gets is the same as Kernel.gets
#
# readlines - reads all lines (from a file for example)
# p readlines("file.txt") # p prints in human-readable format
#
# readlines is also a class method for IO class
# arr = File.readlines("file.txt")
# p arr
#
# File.rename("1.txt", "2.txt")
# File.size("1.txt")
# IO.foreach("myfile.txt") { |line| puts line } # does something for each line
#
# Object can be created to represent the actual file
#
# File.open("myfile.txt", "r") do |file|
#   while line = file.gets
#     puts "reading: #{line}"
#   end
# end
#
# File.open("myfile.txt", "w") do |file|
#   file.puts "new line"
#   file.puts "another new line"
# end
#
# puts File.read("myfile.txt")
#
# ARGV
#
# > ruby myprog.rb "new", "argument", "onemore"
#
# puts ARGV.count # 3
# ARGV.each { |arg| print "#{arg} " } # new argument onemore
#
# ARGF - object for getting files
#
# > ruby moprog.rb file1 file2 "string"
# ARGV = ["file1", "file2", "string"]
# ARGF will get error because of 3rd argument is a string and not a file
#
# Dir class - object represenring directory
#
# Dir.pwd
# Dir.chdir
#
# CSV class to hanlde CSV files
