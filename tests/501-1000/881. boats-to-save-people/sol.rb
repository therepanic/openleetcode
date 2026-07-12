# @param {Integer[]} people
# @param {Integer} limit
# @return {Integer}
def num_rescue_boats(people, limit)
    people.sort!
    start = 0
    end_index = people.length - 1
    boats = 0
    
    while start <= end_index
        if people[start] + people[end_index] <= limit
            start += 1
            end_index -= 1
        else
            end_index -= 1
        end
        boats += 1
    end
    
    return boats
end
