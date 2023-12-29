require 'json'

class Library
    attr_accessor :books
    def initialize
        @books = []
    end
end

class Author
    attr_accessor :name
    def initialize(name)
        @name = name
    end
end

class Book
    attr_accessor :title, :author, :isbn, :available
    def initialize(title, author, isbn)
        @title = title
        @author = author
        @isbn = isbn
        @available = true
    end
end


# User interaction, Comment out to run tests
puts "Welcome to the Library Management System"

loop do
    puts "\nOptions:"
    puts "1. Display Library Catalog"
    puts "2. Search for a Book"
    puts "3. Check Out a Book"
    puts "4. Return a Book"
    puts "5. Exit"
    print "Enter your choice: "
    choice = gets.chomp.to_i
end