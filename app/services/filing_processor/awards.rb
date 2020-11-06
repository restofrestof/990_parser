module FilingProcessor
  class Awards
    attr_reader :awards, :errors

    def initialize(awards, granter, tax_year, filing)
      @errors = []
      @awards = awards.map do |a|
        award = ::FilingProcessor::Award.new(a, granter, tax_year, filing).award
        persist(award)

        award if award.persisted?
      end.flatten
    end

    def persist(award)
      if award.recipient.valid?
        award.recipient.save!
        persist_award(award)
      else
        errors << { award: award.as_json, recipient: award.recipient.as_json, error: recipient.errors }
      end
    end

    def persist_award(award)
      if award.valid?
        award.save!
      else
        errors << { award: award.as_json, recipientId: award.recipient.id, recipient: award.recipient.as_json, error: award.errors }
      end
    end
  end
end