module Parties
	class PartyRole
	  include Mongoid::Document
    include Mongoid::Timestamps

	  embedded_in :party,
	  						class_name: "Parties:Party"

    # Begin date for this party_role 
	  field :from_date, type: Date 

	  # End date for this party_role
	  field :thru_date, type: Date

	  delegate :kind_key,			to: :party_role_kind, allow_nil: false
	  delegate :name, 				to: :party_role_kind, allow_nil: false
	  delegate :description, 	to: :party_role_kind, allow_nil: true

	  # party_role_kinds can apply to only one party subclass, and others may 
	  # apply to more than one party subclass.  
	  # Some may be dependent on presence of other attributes, such as Party::PartyRelationship
	  # Examples:
	  # 	OrganizationParty-only party_role_kinds: :insured_organization
	  # 	PersonParty-only party_role_kinds: :insured_employee, :insured_consumer, :insured_dependent
	  # 	Shared OrganizationParty and PersonParty party_role_kinds: 

	  embeds_one :party_role_kind, 
	  					 class_name: "Parties::PartyRoleKind"

    embeds_many :party_relationship_kinds,
    						class_name: "Parties::PartyRelationshipKind"


    def party_relationship_kinds

    	# party_kind:, :person, party_role_kind: :employee_role, party_relationship_kinds: [:employment]
    	# party_kind:, :person, party_role_kind: :patient_role, party_relationship_kinds: [:patient_practitioner_relationship]
    	# party_kind:, :person, party_role_kind: :person, party_relationship_kinds: [:household_member]
    	# party_kind:, :person, party_role_kind: :contact_employer, party_relationship_kinds: [:organization_contact]
    	# party_kind:, :person, party_role_kind: :contact_tpa, party_relationship_kinds: [:organization_contact]



    	# party_kind:, :person, party_role_kind: :person, party_relationship_kinds: [:employment]
    	# party_kind:, :person, party_role_kind: :person, party_relationship_kinds: [:household_member]
    	# party_kind:, :person, party_role_kind: :patient, party_relationship_kinds: [:patient_practitioner_relationship]
    	# party_kind:, :person, party_role_kind: :contact_employer, party_relationship_kinds: [:organization_contact]
    	# party_kind:, :person, party_role_kind: :contact_tpa, party_relationship_kinds: [:organization_contact]

    	# party_kind:, :insured_individual, party_role_kind: :insured_contract_holder, party_relationship_kinds: [:family_dependency]
    	# party_kind:, :insured_individual, party_role_kind: :insured_dependent, party_relationship_kinds: [:household_member]

    	# party_kind:, :organization, party_role_kind: :health_care_provider_organization, party_relationship_kinds: [:provider_network_member]
    end

	end
end
