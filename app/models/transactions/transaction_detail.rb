# Journal entry line item
class Transactions::TransactionDetail
  include Mongoid::Document
  include Mongoid::Timestamps

  embedded_in :transaction,
  						class_name: "Transactions::Transaction"

  field :order, type: Integer, default: 0
	field :associated_transaction_details, type: Array, default: []

	# Enrollment attributes follow

end
