class Coverages::CoverageAvailability
  include Mongoid::Document

  belongs_to :insurance_product
  belongs_to :benefit_category
  has_and_belongs_to_many :geographic_service_areas

  embeds_one :coverage_level

  field :from_date,										type: Date
  field :thru_date,										type: Date
  field :coverage_dependencies, 			type: Array, default: []
  field :coverage_incompatibilities, 	type: Array, default: []

end
