require 'json'

class Library
    attr_accessor :books
    def initialize
        @books = []
    end

    def add_book(book)
        books << book
    end

    def catalog
        catalog = books.map do |book|
            { 
                title: book.title, 
                author: book.author.name, 
                isbn: book.isbn, 
                available: book.available 
            }
        end
        puts JSON.pretty_generate(catalog)
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


# Create authors
author1 = Author.new('Stephen King')
author2 = Author.new('James Patterson')
author3 = Author.new('George R. R. Martin')

# Create books
book1 = Book.new('IT', author1, '12245675689')
book2 = Book.new('Alex Cross', author2, '958766548321')
book3 = Book.new('A Game of Thrones', author3, '1323444567809')
book4 = Book.new('A Clash of Kings', author3, '9878676543921')

# Create library
library = Library.new
library.add_book(book1)
library.add_book(book2)
library.add_book(book3)
library.add_book(book4)


# User interaction, Comment out to run tests
puts "Welcome to the Library Management System"

loop do
    puts "\nOptions:"
    puts "1. Display Library Catalog"
    puts "2. Search for a Book"
    puts "3. Check Out or Return a Book"
    puts "4. Exit"
    choice = gets.chomp.to_i

    case choice
    when 1
      library.catalog
    else
      puts "SHHHHH! please be quite in the library"
    end
end
