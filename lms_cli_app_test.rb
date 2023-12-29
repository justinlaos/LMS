require 'test/unit'
require './lms_cli_app.rb'

class MainTest < Test::Unit::TestCase
    def test_world
      assert_equal "Hello, LMS!", Main.talk
    end
end

