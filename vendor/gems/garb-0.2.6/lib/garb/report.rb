module Garb
  class Report
    include Resource::ResourceMethods

    MONTH = 2592000
    URL = "https://www.google.com/analytics/feeds/data"

    def initialize(profile, opts={})
      @profile = profile

      @start_date = opts.fetch(:start_date, Time.now - MONTH)
      @end_date = opts.fetch(:end_date, Time.now)
      @limit = opts.fetch(:limit, nil)
      @offset = opts.fetch(:offset, nil)

      # clear filters and sort
      @filters = ReportParameter.new(:filters)
      @sorts = ReportParameter.new(:sort)

      metrics opts.fetch(:metrics, [])
      dimensions opts.fetch(:dimensions, [])
      filter opts.fetch(:filter, [])
      sort opts.fetch(:sort, [])
    end

    def results
      ReportResponse.new(send_request_for_body).results
    end

  end
end
