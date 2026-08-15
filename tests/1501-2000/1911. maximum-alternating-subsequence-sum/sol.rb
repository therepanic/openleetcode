# @param {Integer[]} nums

# @return {Integer}

def max_alternating_sum(nums)
    even = 0
    odd = 0
    nums.each do |value|
        next_even = [even, odd + value].max
        next_odd = [odd, even - value].max
        even = next_even
        odd = next_odd
    end
    even

end
