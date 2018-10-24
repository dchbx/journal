class Products::ProductCategory
  include Mongoid::Document

  # Example: Life Insurance/Term Life insurance/Individual
  # Example: Health Insurance/Group health insurance/Aetna PPO Plan
 	# hi = Products::ProductCategory.new(description: "Health insurance")
	# => #<Products::ProductCategory _id: 5bb362f02dc03d2f6705ea98, description: "Health insurance">

	# child1 = hi.child_product_categories.build(description: "Group health insurance")
	# => #<Products::ProductCategory _id: 5bb3635c2dc03d2f6705ea99, description: "Group health insurance">

	# grandchild1 = child1.child_product_categories.build(description: "Aetna PPO Plan")
	# => #<Products::ProductCategory _id: 5bb363af2dc03d2f6705ea9b, description: "Aetna PPO Plan">

	# grandchild1.parent_product_category
	# => #<Products::ProductCategory _id: 5bb3635c2dc03d2f6705ea99, description: "Group health insurance">

	# child1.parent_product_category
	# => #<Products::ProductCategory _id: 5bb362f02dc03d2f6705ea98, description: "Health insurance">

	# child2 = hi.child_product_categories.build(description: "Individual health insurance")
	# => #<Products::ProductCategory _id: 5bb3648d2dc03d2f6705ea9c, description: "Individual health insurance">
	
	# hi.child_product_categories
	# => [#<Products::ProductCategory _id: 5bb3635c2dc03d2f6705ea99, description: "Group health insurance">, #<Products::ProductCategory _id: 5bb3648d2dc03d2f6705ea9c, description: "Individual health insurance">]
  recursively_embeds_many

  field :description, type: String


end
