# frozen_string_literal: true

# print the star pattern with first line 10 stars, second line 9 stars, and so on
puts 'Step 1 - Star Pattern:'
10.downto(1) do |i|
  puts '*' * i
end

# print the sum of the numbers from 1 to 10
puts "\nStep 2 - Sum of Numbers 1 to 10:"
sum = 0
10.times do |i|
  sum += i + 1
end
puts sum

# filter the books that are published after 2000
puts "\nStep 3 - Books published after 2000:"
books = [
  { title: 'The Fellowship of the Ring', year: 1954 },
  { title: "Harry Potter and the Sorcerer's Stone", year: 1997 },
  { title: 'American Gods', year: 2001 },
  { title: 'The Da Vinci Code', year: 2003 },
  { title: 'Twilight', year: 2005 },
  { title: 'The Road', year: 2006 },
  { title: 'Nineteen Eighty-Four', year: 1949 }
]
# not using extra variable
books.select { |book| book[:year] > 2000 }.each { |book| puts "#{book[:title]} -- #{book[:year]}" }
# using extra variable
# books_after2000 = books.select { |book| book[:year] > 2000 }
# books_after2000.each do |book|
#   puts "#{book[:title]} was published in #{book[:year]}"
# end

# select and save immediate family members
puts "\nStep 4 - Immediate family members:"
family = { uncles: %w[bob joe steve],
           sisters: %w[jane jill beth],
           brothers: %w[frank rob david],
           aunts: %w[mary sally susan] }
names = family.select { |k| %i[sisters brothers].include?(k) }.values
puts names

# select groups of words that are anagrams
puts "\nStep 5 - Anagrams:"
words = %w[demo none tied evil dome mode live fowl veil wolf diet vile edit tide flow neon]
anagrams = words.group_by { |word| word.chars.sort }.values
anagrams.each { |group| print "#{group}\n" }
