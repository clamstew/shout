# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Goal: Create a DB record for every word in word list.
# When a link expires, free that word for further use.

words_file = File.read File.join(Rails.root, 'lib/word_list.txt')

count = 0
words_file.lines.each do |word|
  UrlWord.create :word => word.strip
  count += 1
  # IO is slow, so only puts this every 100 words
  puts "Seeded #{count} words so far..." if count % 100 == 0
end
