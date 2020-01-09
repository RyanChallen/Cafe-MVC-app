require_relative "../models/cafe"
require_relative "../views/cafe_views"


class CafeController

    def initialize(name, menu_items)
        @cafe_model = CafeModel.new(name, menu_items)
        @cafe_view = CafeView.new()
    end

    def run
       @cafe_view.welcome(@cafe_model.name)
       loop do
           @cafe_view.print_menu(@cafe_model.menu)
           @cafe_view.place_order
           
       end
    end

end