class Filing < ActiveRecord::Base
  belongs_to :granter, optional: true
  has_many :awards, inverse_of: :filing
  has_many :recipients, through: :awards, inverse_of: :filings

  START_STATUS = 'Started'
  COMPLETED_STATUS = 'Completed'
  BAD_DOCUMENT = 'Bad Document'
  DUPLICATE = 'Duplicate Filing'
end
