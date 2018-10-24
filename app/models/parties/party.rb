module Parties
	class Party
  	include Mongoid::Document
    include Mongoid::Timestamps


	  embeds_many :party_roles, 
	  						class_name: "Parties::PartyRole"

	  embeds_many :party_relationships, 
	  						class_name: "Parties::PartyRelationship"

	  field :party_id, type: Integer

	end
end
