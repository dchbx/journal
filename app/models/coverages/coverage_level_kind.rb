class Coverages::CoverageLevelKind
  include Mongoid::Document

  has_many :coverage_levels

  field :key,										type: String
  field :name, 									type: String
  field :description, 					type: String

end
