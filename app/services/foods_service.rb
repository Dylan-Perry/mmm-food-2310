class FoodsService
    def conn
        Faraday.new(url: "https://api.nal.usda.gov/fdc/v1") do |faraday|
            faraday.headers["X-Api-Key"] = Rails.application.credentials.food_data_central[:key]
        end
    end

    def get_url(url)
        response = conn.get(url)

        JSON.parse(response.body, symbolize_names: true)
    end

    # Page size param currently limits results to 10
    def get_foods_by_name(name)
        get_url("https://api.nal.usda.gov/fdc/v1/foods/search?query=#{name}&pageSize=10")
    end
end