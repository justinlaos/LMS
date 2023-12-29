require 'json'

class Library
    attr_accessor :books
    def initialize
        @books = []
    end

    def add_book(book)
        books << book
    end

    def get_book(title)
        book = books.find { |book| book.title == title }
        if book == nil
            puts "\nBook does not exist. Maybe you should write it yourself"
            return
        else
            book
        end
    end

    def search_for_book(title)
        book = get_book(title)
        return if book == nil
        puts JSON.pretty_generate({ title: book.title, author: book.author.name, isbn: book.isbn, available: book.available } )
    end

    def checkout_or_return_book(title)
        book = get_book(title)
        return if book == nil
        book.available = !book.available
        puts book.available ? "\nThanks for returning this book, even though its late" : "\nAlright enjoy your book. Dont lose it for 30 years"
    end

    def catalog
        catalog = books.map do |book|
            { title: book.title, author: book.author.name, isbn: book.isbn, available: book.available }
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

    case gets.chomp.to_i
    when 1
        library.catalog
    when 2
        print "\nEnter books title: "
        title = gets.chomp
        library.search_for_book(title)
    when 3
        print "\nEnter the title of the book to check out or return: "
        title = gets.chomp
        library.checkout_or_return_book(title)
    when 4
        break
    else
        puts "\nSHHHHH! please be quite in the library"
    end
end
