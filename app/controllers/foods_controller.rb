class FoodsController < ApplicationController
    def index
        @facade = FoodsFacade.new(params[:search_foods])
    end
end