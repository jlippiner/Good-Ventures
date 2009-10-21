require 'test/test_helper'

class ConversionTest < ActiveSupport::TestCase
  should_belong_to :visit
  should_validate_presence_of :visit_id
  should_validate_numericality_of :value
end
