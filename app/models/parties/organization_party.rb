module Parties
	class OrganizationParty < Party

	  field :organization_id, type: String
	  field :name, 						type: String
	  field :dba, 						type: String
	  field :fein,						type: String
	  
	end
end
