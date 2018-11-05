module Parties
	class PartyRelationship
	  include Mongoid::Document
    include Mongoid::Timestamps


    has_and_belongs_to_many :subject_parties, inverse_of: :related_parties, autosave: true,
                            class_name: "Parties::Party"

    has_and_belongs_to_many :related_parties, inverse_of: :subject_parties, autosave: true,
                            class_name: "Parties::Party"

    embeds_one :party_relationship_kind

    # Begin date for this relationship
	  field :from_date, type: Date 

	  # End date for this relationship
	  field :thru_date, type: Date

	  delegate :kind_key,			to: :party_relationship_kind, allow_nil: false
	  delegate :name, 				to: :party_relationship_kind, allow_nil: false
	  delegate :description, 	to: :party_relationship_kind, allow_nil: true


	  def relationship_kinds
	  	[
	  			:organization_contact,
	  			:employment,
	  			:patient_practitioner,
	  			:patient_provider,
	  			:practice_affiliation,
	  			:provider_network,
	  		]
	  end

	  def person_party_roles_kinds
	  	[:person, :organization_contact, :insured_contract_holder, :insured_dependent, :individual_health_care_practitioner, ]
	  end

	  def person_party_relationship_kinds
	  	[:household_member, :family_dependency, :patient_practitioner_relationship]
	  end


	  def person
	  	{
	  		person_party: "john",
	  			party_role_kinds: [:person, :patient, :insured_contract_holder],
	  			party_relationships: [
	  				{
		  				relationship_kind: 	:patient_practitioner_relationship,
		  				related_party: 			"dr jones",
		  				party_role_kind: 		:patient,
		  				related_role: 			:individual_health_care_practitioner,
		  				start_date: 				"Wed, 03 Oct 2018",
		  				end_date: 					"Thu, 04 Oct 2018",
		  			},
	  				{
		  				relationship_kind: 	:household_member,
		  				related_party: 			"smith",
		  				party_role_kind: 		:person,
		  				related_role: 			:household,
		  				start_date: 				"Wed, 03 Oct 2018",
		  				end_date: 					"Thu, 04 Oct 2018",
		  			},
	  				{
		  				relationship_kind: 	:family_dependency,
		  				related_party: 			"jane",
		  				party_role_kind: 		:insured_contract_holder,
		  				related_role: 			:insured_dependent,
		  				start_date: 				"Wed, 03 Oct 2018",
		  				end_date: 					"Thu, 04 Oct 2018",
		  			},
	  			]
	  	}


	  def transaction_detail
	  	{ id: 123, payload: [
		  		{ subject_role: :person, 	id: "john", related_role: :household, related_party: "smith", relationship_kind: :household_member  },
		  		{ subject_role: :person, 	id: "jane", related_role: :household, related_party: "smith", relationship_kind: :household_member  },
		  		{ subject_role: :insured_contract_holder, id: "john", related_role: :insured_dependent, id: "jane", relationship_kind: :family_dependency  },
		  		{ subject_role: :patient, id: "john", related_role: :individual_health_care_practitioner, id: "dr jones", relationship_kind: :patient_practitioner_relationship  },
		  	]
	  	}
		end


	  class PatientPractitionerRelationship
	  	has_one  :patient
	  	has_many :health_care_provider_organization

	  	field :is_primary_care_provider, type: Boolean

	  end

	  class PracticeAffiliationRelationship
	  	has_one  :individual_health_care_practitioner
	  	has_many :health_care_provider_organizations

	  end

	  class ProviderNetworkRelationship
	  	has_one :provider 
	  	has_many :health_care_networks
	  end

	end
end
