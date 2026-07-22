# @param {Integer[]} nums
# @return {Integer}
def max_product(nums)
    max1, max2 = 0, 0
    nums.each do |num|
        if num > max1
            max2 = max1
            max1 = num
        elsif num > max2
            max2 = num
        end
    end
    (max1 - 1) * (max2 - 1)
end
