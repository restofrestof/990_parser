module FilingProcessor
  class Granter < ::FilingProcessor::Base
    attr_reader :granter

    def initialize(parsed_object)
      @parsed_object = parsed_object

      @granter = find_or_create
    end

    def find_or_create
      grant = ::Granter.find_by(ein: dig(['EIN']))
      return grant if grant.present?

      grant = ::Granter.new
      grant.name = dig(['Name', 'BusinessNameLine1'])
      grant.ein = dig(['EIN'])
      grant.address = dig(['USAddress', 'AddressLine1'])
      grant.city = dig(['USAddress', 'City'])
      grant.state = dig(['USAddress', 'State'])
      grant.zip_code = dig(['USAddress', 'ZIPCode'])
      grant.save!
      grant
    end
  end
end