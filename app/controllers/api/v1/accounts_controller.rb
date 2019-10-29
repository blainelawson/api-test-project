class Api::V1::AccountsController < ApplicationController

    def index
        @accounts = Account.all

        render json: @accounts
    end

    def show
        @account = Account.find_by(id: params[:id])

        render json: @account
    end

    def create
        @account = Account.new(account_params)
        if @account.save 
            render json: @account
        else
            render json: {error: "Error creating account"}
        end
    end

    def destroy
        @account = Account.find_by(params[:id])
        @account.destroy
    end

    def update
    end

    private

    def account_params
        params.require(:account).permit(:name, :balance)
    end

end
