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
        if params[:id].to_i < @data.size
            @data = @data[params[:id].to_i]
        else
            @error = "No item with id: #{params[:id]}" 
        end
    end

    private
    def setup_data
        @data = [
            {item: "tea", price: 3, quantity: 0},
            {item: "coffee", price: 4, quantity: 10},
            {item: "scones", price: 5, quantity: 20}
        ]
    end

end
