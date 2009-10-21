require 'test/test_helper'

class UserTest < Test::Unit::TestCase
  should_have_one :client

  context "A User instance" do
    setup do
      user = Factory.create(:user)
    end
  end
end
