module Transactions
  TRANSACTION_KINDS = []

	class TransactionKind
	  include Mongoid::Document
	  include Mongoid::Timestamps


		  embedded_in :transaction,
		  						class_name: "Transactions::Transaction"

		  field :key,										type: Symbol
		  field :title, 									type: String
		  field :description, 					type: String


		  # private



		  def kind_konstant(kind_class)
		  	module_name = kind_class.to_s.deconstantize
	  		"#{module_name}::#{module_name.singularize.upcase}_KINDS".constantize
		  end

		  def initialize_kind(kind_class)
		  	list = [ 
			  			add_enrollment: { title: "Add Enrollment", description: "" },
			  			terminate_enrollment: { title: "Terminate Enrollment", description: "" },
			  		]

			  binding.pry
		  	kind_konstant = list.reduce([]) { |kind_list, kind| kind_list << kind }
		  end

		  def load_kinds(kind_class)
		  end

		  def add_kind(kind_class, kind)
		  end

		  def update_kind(kind_class, kind)
		  end

		  def delete_kind(kind_class, kind)
		  end

	end
end
