# @param {Integer[]} candies
# @param {Integer} extra_candies
# @return {Boolean[]}
def kids_with_candies(candies, extra_candies)
    current_max = candies.max
    result = []
    candies.each do |candy_count|
        if candy_count + extra_candies >= current_max
            result << true
        else
            result << false
        end
    end
    result
end
