require File.join(File.dirname(__FILE__), '..', '/test_helper')

module Garb
  # Also tests Garb::Resource, which is the basis for Garb::Report
  class ReportTest < Test::Unit::TestCase    
    context "An instance of the Report class" do
      setup do
        @now = Time.now
        Time.stubs(:now).returns(@now)
        @profile = stub(:table_id => 'ga:1234')
        @report = Report.new(@profile)
      end

      %w(metrics dimensions filters sorts).each do |param|
        should "have parameters for #{param}" do
          assert @report.send(:"#{param}").is_a?(ReportParameter)
        end
      end

      should "have default parameters" do
        @report.stubs(:format_time).returns('2009-08-01')
        params = {'ids' => 'ga:1234', 'start-date' => '2009-08-01', 'end-date' => '2009-08-01'}
        assert_equal params, @report.default_params
      end

      should "collect params from metrics, dimensions, filters, sort, and defaults" do
        @report.stubs(:metrics).returns(stub(:to_params => {'metrics' => 6}))
        @report.stubs(:dimensions).returns(stub(:to_params => {'dimensions' => 5}))
        @report.stubs(:filters).returns(stub(:to_params => {'filters' => 4}))
        @report.stubs(:sorts).returns(stub(:to_params => {'sort' => 3}))
        @report.stubs(:page_params).returns({'page_params' => 2})
        @report.stubs(:default_params).returns({'default_params' => 1})
        
        params = {'metrics' => 6, 'dimensions' => 5, 'filters' => 4, 'sort' => 3, 'page_params' => 2, 'default_params' => 1}
        assert_equal params, @report.params
      end

      should "format time" do
        assert_equal @now.strftime('%Y-%m-%d'), @report.format_time(@now)
      end

      should "send a data request to GA" do
        response = mock {|m| m.expects(:body).returns('response body') }
        request = mock {|m| m.expects(:send_request).returns(response) }
        @report.expects(:params).returns('params')

        DataRequest.expects(:new).with(Garb::Report::URL, 'params').returns(request)
        assert_equal 'response body', @report.send_request_for_body
      end

      should "fetch and parse results from GA" do
        @report.expects(:send_request_for_body).with().returns('xml')
        ReportResponse.expects(:new).with('xml').returns(mock(:results => ['entry']))
        assert_equal ['entry'], @report.results
      end
    end
    
    context "An instance of the Report class with initial options" do
      setup do
        @profile = stub(:table_id => 'ga:1234')
        @report = Report.new(@profile, :limit => 10, :offset => 20)
      end

      should "have page paramaters" do
        params = {'max-results' => 10, 'start-index' => 20}
        assert_equal params, @report.page_params
      end
    end

  end
end