class MenuController < ApplicationController

    before_action :setup_data

    def index
        # render plain: "Meow"
        #render html: "<h1>Le Menu</h1>".html_safe
        render json: @data
    end

    def create
        render plain: "stuff and things"
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
