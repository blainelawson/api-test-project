class Transaction < ApplicationRecord
    # Relationships ------------->
    belongs_to :account

    # Validations --------------->
    validates :amount, presence: true
    validates_inclusion_of :kind, :in => ['deposit', 'withdwrawal']

end
