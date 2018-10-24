class Coverages::BenefitCategory
  include Mongoid::Document

  field :description, type: String


  # Model uses recursion to structure Benefit Taxonomy
  # Example: Life Insurance/Term Life insurance/Individual
  # Example: Health Insurance/Group health insurance/Aetna PPO Plan
 	# hi = Coverages::BenefitCategory.new(description: "Health insurance")
	# => #<Coverages::BenefitCategory _id: 5bb362f02dc03d2f6705ea98, description: "Health insurance">

	# child1 = hi.child_benefit_categories.build(description: "Group health insurance")
	# => #<Coverages::BenefitCategory _id: 5bb3635c2dc03d2f6705ea99, description: "Group health insurance">

	# grandchild1 = child1.child_benefit_categories.build(description: "Aetna PPO Plan")
	# => #<Coverages::BenefitCategory _id: 5bb363af2dc03d2f6705ea9b, description: "Aetna PPO Plan">

	# grandchild1.parent_benefit_category
	# => #<Coverages::BenefitCategory _id: 5bb3635c2dc03d2f6705ea99, description: "Group health insurance">

	# child1.parent_benefit_category
	# => #<Coverages::BenefitCategory _id: 5bb362f02dc03d2f6705ea98, description: "Health insurance">

	# child2 = hi.child_benefit_categories.build(description: "Individual health insurance")
	# => #<Coverages::BenefitCategory _id: 5bb3648d2dc03d2f6705ea9c, description: "Individual health insurance">
	
	# hi.child_benefit_categories
	# => [#<Coverages::BenefitCategory _id: 5bb3635c2dc03d2f6705ea99, description: "Group health insurance">, #<Coverages::BenefitCategory _id: 5bb3648d2dc03d2f6705ea9c, description: "Individual health insurance">]

  recursively_embeds_many

  has_many :coverage_availabilities

  

end
