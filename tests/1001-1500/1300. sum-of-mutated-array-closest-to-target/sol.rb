# @param {Integer[]} arr
# @param {Integer} target
# @return {Integer}
def find_best_value(arr, target)
    get_mutated_sum = ->(value) {
        arr.sum { |x| [x, value].min }
    }
    
    low = 0
    high = arr.max
    result = high
    min_diff = Float::INFINITY
    
    while low <= high
        mid = (low + high) / 2
        curr_sum = get_mutated_sum.call(mid)
        diff = (curr_sum - target).abs
        
        if diff < min_diff || (diff == min_diff && mid < result)
            min_diff = diff
            result = mid
        end
        
        if curr_sum < target
            low = mid + 1
        else
            high = mid - 1
        end
    end
    
    result
end
