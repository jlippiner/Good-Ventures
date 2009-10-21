require 'test/test_helper'

class ClientTest < ActiveSupport::TestCase
  should_have_one :owner
  should_have_many :websites
  should_validate_presence_of :name

  context "A client instance" do
    setup do
      @client = Factory.create(:client)
    end

    should "should have a status set to 1" do
      assert_equal 1, @client.status
    end
  end
end
