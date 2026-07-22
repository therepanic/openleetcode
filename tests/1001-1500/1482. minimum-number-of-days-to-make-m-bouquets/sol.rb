# @param {Integer[]} bloom_day
# @param {Integer} m
# @param {Integer} k
# @return {Integer}
def min_days(bloom_day, m, k)
    return -1 if m * k > bloom_day.length
    
    f = ->(time_limit) {
        cntr = 0
        bouquet_cntr = 0
        bloom_day.each do |day|
            if day <= time_limit
                cntr += 1
                if cntr == k
                    bouquet_cntr += 1
                    cntr = 0
                end
            else
                cntr = 0
            end
        end
        bouquet_cntr >= m
    }
    
    s = bloom_day.min
    e = bloom_day.max
    ans = -1
    
    while s <= e
        mid = s + (e - s) / 2
        if f.call(mid)
            ans = mid
            e = mid - 1
        else
            s = mid + 1
        end
    end
    
    ans
end
