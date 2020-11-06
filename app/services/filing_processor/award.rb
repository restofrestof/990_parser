module FilingProcessor
  class Award < ::FilingProcessor::Base
    attr_reader :award

    def initialize(parsed_object, granter, tax_year, filing)
      @parsed_object = parsed_object
      @award = ::Award.new
      award.amount = dig('AmountOfCashGrant')
      award.purpose = dig('PurposeOfGrant')
      award.tax_year = tax_year
      award.recipient = ::FilingProcessor::Recipient.new(parsed_object).recipient
      award.granter = granter
      award.filing = filing
    end
  end
end