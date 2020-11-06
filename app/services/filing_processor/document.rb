module FilingProcessor
  class Document < FilingProcessor::Base
    attr_reader :valid, :filing

    def initialize(parsed_object, filing)
      @parsed_object = parsed_object
      @valid = true
      @filing = filing
      validate_filing
    end

    def validate_filing
      if dig(['Return', 'ReturnData']).keys.exclude?('IRS990') || dig(['Return', 'ReturnData']).keys.exclude?('IRS990ScheduleI')
        @valid = false
        filing.update!(status: ::Filing::BAD_DOCUMENT)
      end
    end
  end
end