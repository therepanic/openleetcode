# @param {Integer[]} distance
# @return {Boolean}
def is_self_crossing(distance)
    (3...distance.length).each do |i|
        if distance[i] >= distance[i - 2] && distance[i - 1] <= distance[i - 3]
            return true
        end
        if i >= 4
            if distance[i - 1] == distance[i - 3] && distance[i] + distance[i - 4] >= distance[i - 2]
                return true
            end
        end
        if i >= 5
            if (distance[i - 2] > distance[i - 4] &&
                distance[i] >= distance[i - 2] - distance[i - 4] &&
                distance[i - 1] >= distance[i - 3] - distance[i - 5] &&
                distance[i - 1] <= distance[i - 3])
                return true
            end
        end
    end
    false
end
