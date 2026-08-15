# @param {Integer[]} nums

# @return {Integer}

def max_product_difference(nums)

    nums.sort!
    (nums[-1] * nums[-2]) - (nums[0] * nums[1])

end
