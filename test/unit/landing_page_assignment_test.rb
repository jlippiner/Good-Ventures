require 'test_helper'

class LandingPageAssignmentTest < ActiveSupport::TestCase
  context "A landing page assignment" do
    should_belong_to :landing_page
    should_belong_to :landing_page_group
    
    should_validate_presence_of :landing_page, :landing_page_group
  end
end
