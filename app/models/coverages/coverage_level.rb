class Coverages::CoverageLevel
  include Mongoid::Document

  embedded_in :coverage_availability

  field	:coverage_amount,		type: Integer, default: 0
  field :coverage_range, 		type: Range 
  field :deductable_amount, type: String
  field :copay_amount, 			type: Integer, default: 0
  field :coinsurance_pct, 	type: Integer, default: 0

  field :coverage_level_kind_id, type: BSON::ObjectId

  # Claims payment basis, e.g. "per incident", "per year"
  field :coverage_level_basis_kind_id, type: BSON::ObjectId


end
