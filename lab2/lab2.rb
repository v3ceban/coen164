# frozen_string_literal: true

puts 'Part 4: Search'
# Part 4 Search
def search(**params)
  invalid_options = params.keys - %i[genre duration]
  print 'option: ', params, "\n"
  print "Invalid options: #{invalid_options.join(', ')}\n" unless invalid_options.empty?
end

print search genre: 'comedy'
print search genre: 'comedy', duration: 120
print search genre: 'comedy', duration: 120, other: 'other'

puts "\nPart 5: Parent and Child\n"
# Part 5 Parent Class
class Parent
  def initialize(name = 'nobody')
    @name = name
  end
end

# Part 5 Child Class
class Child < Parent
  attr_accessor :name, :grade

  def initialize(name, grade)
    super(name)
    @grade = grade
  end
end

y = Child.new('yuan', 100)

print 'name is ', y.name, "\n"
puts y.grade
y.grade = 90
puts y.grade

puts "\nPart 6: Redefining Array#map method\n"
# Part 6 Array#map
class Array
  def map
    result = []
    each { |x| result << yield(x) }
    result
  end
end

print([1, 2, 3, 4, 5].map do |x|
  puts "#{x} - #{x * 3}"
  x * 3
end, "\n")

puts "\nPart 7: Array to Hash\n"
# Part 7 Array to Hash
class Array
  def array_to_hash
    result = {}
    each { |x| result[x[0]] = x[1] }
    result
  end
end

blockbusters = [['jacky chan', 'the foreigner'], ['marisa tomei', 'my cousin vinny'],
                ['drew barrymore', '50 first dates']]

print blockbusters.array_to_hash, "\n"

puts "\nPart 8: Power\n"
# Part 8: Power
def power(num, power)
  (1..num).each do |i|
    yield i**power
  end
end

power(8, 3) { |x| print x, ', ' }
puts

puts "\nPart 9: 52 Cards\n"
# Part 9: 52 Cards
def create_deck(ranks, suits)
  suits.product(ranks).map { |s, r| [r, s] }
end

suits = %w[spades hearts diamonds clubs]
ranks = %w[2 3 4 5 6 7 8 9 10 J Q K A]

print create_deck(ranks, suits), "\n"

puts "\nPart 10: Books and Members\n"
# Part 10: Book Class
class Book
  attr_accessor :title, :author, :isbn, :status

  def initialize(title, author, isbn)
    @title = title
    @author = author
    @isbn = isbn
    @status = 'available'
  end

  def display_info
    puts "Title: #{@title}"
    puts "Author: #{@author}"
    puts "ISBN: #{@isbn}"
    puts "Status: #{@status}"
  end

  def check_out
    if @status == 'available'
      @status = 'borrowed'
      puts 'Book checked out successfully.'
    else
      puts 'Book is already checked out.'
    end
  end

  def return_book
    if @status == 'borrowed'
      @status = 'available'
      puts 'Book returned successfully.'
    else
      puts 'Book is already returned.'
    end
  end
end

# Part 10: Member Class
class Member
  attr_accessor :name, :id, :borrowed_books

  def initialize(name, id)
    @name = name
    @id = id
    @borrowed_books = []
  end

  def display_info
    puts "Name: #{@name}"
    puts "ID: #{@id}"
    return if @borrowed_books.empty?

    puts 'Books currently borrowed:'
    @borrowed_books.each do |book|
      puts "- #{book.title}"
    end
  end

  def borrow_book(book)
    if book.status == 'available'
      @borrowed_books << book
      book.status = 'borrowed'
      puts "#{book.title} borrowed successfully."
    else
      puts "#{book.title} is not available to borrow."
    end
  end

  def return_book(book)
    if @borrowed_books.include?(book)
      @borrowed_books.delete(book)
      book.status = 'available'
      puts "#{book.title} returned successfully."
    else
      puts "#{book.title} is not borrowed by this member."
    end
  end
end

book1 = Book.new('The Great Gatsby', 'F. Scott Fitzgerald', '9780743273565')
# book2 = Book.new('To Kill a Mockingbird', 'Harper Lee', '9780061120081')
# book3 = Book.new('1984', 'George Orwell', '9780451524935')

member1 = Member.new('John Smith', '12345')
member2 = Member.new('Jane Doe', '67890')
# member3 = Member.new('Bob Johnson', '13579')

member2.borrow_book(book1)
member1.return_book(book1)
member1.borrow_book(book1)

member1.display_info
member2.display_info
