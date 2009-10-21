require 'test/test_helper'

class LandingPageGroupTest < ActiveSupport::TestCase
  context "A Landing Page Group" do
    should_belong_to :website
    should_have_one :landing_page
  end
end
