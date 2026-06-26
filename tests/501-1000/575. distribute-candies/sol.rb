# @param {Integer[]} candy_type
# @return {Integer}
def distribute_candies(candy_type)
    n = candy_type.length
    k = n / 2
    [k, candy_type.uniq.length].min
end
