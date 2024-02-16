class FoodsFacade
    def initialize(param)
        @param = param
    end

    def foods
        service = FoodsService.new
        json = service.get_foods_by_name(@param)

        @foods = json[:foods].map do |food_data|
            Food.new(food_data)
        end
    end

    def foods_total_count
        service = FoodsService.new
        json = service.get_foods_by_name(@param)
        json[:totalHits]
    end
end