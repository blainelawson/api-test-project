class Account < ApplicationRecord
    has_many :transactions

    validates :name, :balance, presence: true

    def update_balance(transaction)
        if transction.kind == "deposit" 
            self.balance += transaction.amount 
            self.save
        elsif transaction.kind == "withdrawal"
            if self.balance >= transaction.amount
                self.balance -= transaction
                self.save
            else
                return "Balance too low."
            end
        end
        
    end

end
