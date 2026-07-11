# @param {Integer[]} weights
# @param {Integer} days
# @return {Integer}
def ship_within_days(weights, days)
    low = weights.max
    high = weights.sum

    while low <= high
        mid = (low + high) / 2

        required_days = 1
        load = 0

        weights.each do |weight|
            if load + weight > mid
                required_days += 1
                load = weight
            else
                load += weight
            end
        end

        if required_days <= days
            high = mid - 1
        else
            low = mid + 1
        end
    end

    low
end
