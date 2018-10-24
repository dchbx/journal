class Transactions::Transaction
  include Mongoid::Document
  include Mongoid::Timestamps

  field :transaction_date,  type: Date 
  field :submitted_at,			type: Time, default: ->{ TimeKeeper.datetime_of_record }
  field :description, 			type: String

  # Transaction summary attributes here

  belongs_to :sender_party,
             class_name: "Parties::Party"
  belongs_to :receiver_party,
             class_name: "Parties::Party"

  embeds_one :transaction_kind, 
  						class_name: "Transactions::TransactionKind"

  embeds_many :transaction_details, 
  						class_name: "Transactions::TransactionDetail"



end
