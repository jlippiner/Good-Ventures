require 'test/test_helper'

class VisitTest < ActiveSupport::TestCase
  should_belong_to :website
  should_have_many :conversions
  should_validate_presence_of :website_id, :landing_page
  
  context "A visit instance for a website" do
     setup do
       @website = Factory.create(:website)
       @visit = Factory.create(:visit, {:website => @website})
     end

     should "should return records with the correct website token specified" do
       assert !Visit.with_website_token(@website.token).empty?
     end

     should "should NOT return a record with a bad website token specified" do
       assert Visit.with_website_token(Random.alphanumeric).empty?
     end
   end
end
