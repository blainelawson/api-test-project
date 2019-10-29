class Api::V1::TransactionsController < ApplicationController
    before_action :set_account

        def index
            render json: @account.transactions
        end
    
        def show
            @transaction = @account.transactions.find_by(id: params[:id])
            render json: @transaction
        end
    
        def create
            @transaction = @account.transactions.build(transaction_params)

            if @account.update_balance(@transaction) != "Balance too low."
                @transaction.save
                render json: @account.transactions
            else
                render json: {error: 'Balance too low'}
            end
        end
    
        def destroy
        end
    
        def update
        end
    
        private

        def set_account
            @account = Account.find(params[:account_id])
        end
    
        def transaction_params
            params.require(:account).permit(:account_id, :amount, :kind, :date, :description)
        end
    
    end
    
end
