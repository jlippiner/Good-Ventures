require 'test/test_helper'

class WebsiteTest < ActiveSupport::TestCase
  should_belong_to :client
  should_have_many :visits
  should_have_many :conversions, :through => :visits
  should_validate_presence_of :client, :url, :name
  should_allow_values_for :url, "http://www.test.com"
  should_not_allow_values_for :url, "test", "test@test.com"

  context "A website instance" do
    setup do
      @website = Factory.create(:website)
    end

    context "newly created" do
      should "should have a status set to 1" do
        assert_equal 1, @website.status
      end

      should "create a unique token" do
        assert_not_nil @website.token
      end

      should "refresh the website cache" do
        all_sites = Rails.cache.read('Website.all')
        site = all_sites.detect {|x| x[:token] == @website.token}
        assert_not_nil site
      end
    end

  end
end
