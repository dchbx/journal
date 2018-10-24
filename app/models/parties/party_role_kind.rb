module Parties
	class PartyRoleKind
	  include Mongoid::Document
    include Mongoid::Timestamps

	  embedded_in :role_castable, polymorphic: true

	  # embedded_in :party_role,
	  # 						class_name: "Parties::PartyRole"

	  field :key,										type: String
	  field :name, 									type: String
	  field :description, 					type: String
	  field :valid_party_subtypes, 	type: Array, default: []


	  embeds_many :party_relationship_kinds

	  


	end
end
