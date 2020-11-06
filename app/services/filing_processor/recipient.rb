module FilingProcessor
  class Recipient < ::FilingProcessor::Base
    attr_reader :recipient

    def initialize(parsed_object)
      @parsed_object = parsed_object

      @recipient = find_or_create
    end

    def find_or_create
      name = dig(['RecipientNameBusiness', 'BusinessNameLine1'])
      ein = dig(['EINOfRecipient'])
      address = dig(['AddressUS', 'AddressLine1'])
      city = dig(['AddressUS', 'City'])
      state = dig(['AddressUS', 'State'])
      zip_code = dig(['AddressUS', 'ZIPCode'])
      section = dig(['IRCSection'])

      if ein.present?
        rec = ::Recipient.find_by(ein: ein)
      else
        rec = ::Recipient.find_by(section: section, address: address,
                                  city: city, state: state,
                                  zip_code: zip_code)
      end
      return rec if rec.present?

      ::Recipient.new(section: section, address: address, city: city,
                      state: state, zip_code: zip_code, name: name,
                      ein: ein)
    end
  end
end