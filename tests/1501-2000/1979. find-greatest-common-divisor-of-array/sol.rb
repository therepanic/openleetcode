# @param {Integer[]} nums
# @return {Integer}
def find_gcd(nums)
    a = nums.min
    b = nums.max
    while b != 0
        a, b = b, a % b
    end
    a
end
