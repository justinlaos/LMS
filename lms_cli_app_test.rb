require 'test/unit'
require_relative 'lms_cli_app'

class TestAuthor < Test::Unit::TestCase
    def test_create_author_with_name
        author = Author.new("Test Author")
        assert_equal("Test Author", author.name)
    end
end

class TestBook < Test::Unit::TestCase
    def test_create_book_with_attributes
        author = Author.new("Test Author")
        book = Book.new("Test Book", author, "123456789")
        assert_equal("Test Book", book.title)
        assert_equal(author, book.author)
        assert_equal("123456789", book.isbn)
        assert_equal(true, book.available)
    end
end

class TestLibrary < Test::Unit::TestCase
    def setup
        @author1 = Author.new('Test Author 1')
        @author2 = Author.new('Test Author 2')
        @book1 = Book.new('Test Book 1', @author1, '123456789', true)
        @book2 = Book.new('Test Book 2', @author2, '987654321', false)
    
        @library = Library.new
        @library.add_book(@book1)
        @library.add_book(@book2)
    end
  
    def test_catalog_in_json_format
        assert_output(nil, /Book 1.*Book 2/m) { @library.catalog }
    end

    def test_checkout_book
        assert_output(/Alright enjoy your book. Dont lose it for 30 years/) { @library.checkout_or_return_book('Book 1') }
        assert_equal(false, @book1.available)
    end
    
end
