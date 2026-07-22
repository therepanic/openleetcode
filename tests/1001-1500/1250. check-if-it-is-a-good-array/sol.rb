# @param {Integer[]} nums
# @return {Boolean}
def is_good_array(nums)
    g = nums[0]
    nums[1..].each do |num|
        g = g.gcd(num)
    end
    g == 1
end
