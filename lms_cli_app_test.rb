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

