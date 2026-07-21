# @param {Integer[][]} restaurants
# @param {Integer} vegan_friendly
# @param {Integer} max_price
# @param {Integer} max_distance
# @return {Integer[]}
def filter_restaurants(restaurants, vegan_friendly, max_price, max_distance)
    restaurants_filtered = []

    restaurants.each do |restaurant|
        if vegan_friendly == 1 && restaurant[2] != 1
            next
        end
        
        if restaurant[3] > max_price
            next
        end

        if restaurant[4] > max_distance
            next
        end

        restaurants_filtered << [restaurant[1], restaurant[0]]
    end

    restaurants_filtered.sort!
    restaurants_filtered.reverse!

    result = []

    restaurants_filtered.each do |restaurant|
        result << restaurant[1]
    end

    return result
end
