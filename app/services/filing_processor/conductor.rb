module FilingProcessor
  class Conductor
    attr_reader :filing, :granter, :awards, :document

    def initialize(xml)
      @filing = ::Filing.create!(original_file: xml, status: Filing::START_STATUS)
      @document = ::FilingProcessor::Document.new(Hash.from_xml(xml), filing)
      return unless document.valid

      create_granter
      if duplicate_filing.present?
        filing.update!(status: Filing::DUPLICATE)
      else
        process_awards
        filing.update!(status: Filing::COMPLETED_STATUS, granter: granter, tax_year: tax_year, award_errors: awards.errors, awards_processed: awards.awards.size)
      end
    end

    def duplicate_filing
      Filing.find_by(granter: granter, tax_year: tax_year)
    end

    def create_granter
      @granter = ::FilingProcessor::Granter.new(document.dig(['Return', 'ReturnHeader', 'Filer'])).granter
    end

    def process_awards
      @awards = ::FilingProcessor::Awards.new(document.dig(['Return', 'ReturnData', 'IRS990ScheduleI', 'RecipientTable']), granter, tax_year, filing)
    end

    def tax_year
      @tax_year ||= document.dig(['Return', 'ReturnHeader', 'TaxYear']) || document.dig(['Return', 'ReturnHeader', 'TaxYr'])
    end
  end
end