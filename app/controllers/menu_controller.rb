class MenuController < ApplicationController

    before_action :setup_data
    skip_before_action :verify_authenticity_token #NOT OK TO DO THIS IN PRODUCTION - SECURITY RISK

    def index
    
    end

    def create
        puts params[:item]
        @data << {:item => params[:item], :price => params[:price]}
        redirect_to "/"
    end

    def show
        if @data[params[:id].to_i] != nil
            render json: @data[params[:id].to_i]
        else
            render plain: "Value #{params[:id]} does not exist."
        end
    end

    private
    def setup_data
        @data = [
            {item: "tea", price: 3, quantity: 0},
            {item: "coffee", price: 4, quantity: 10},
            {item: "scone", price: 5, quantity: 20}
        ]
    end

end
