# @param {Integer} candies
# @param {Integer} num_people
# @return {Integer[]}
def distribute_candies(candies, num_people)
    res = Array.new(num_people, 0)
    give = 1
    i = 0

    while candies > 0
        res[i % num_people] += [give, candies].min
        candies -= give
        give += 1
        i += 1
    end

    res
end
