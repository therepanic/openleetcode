# @param {Integer[]} nums
# @return {Integer[]}
def get_sum_absolute_differences(nums)
    n = nums.length
    pref = Array.new(n)
    pref[0] = nums[0]
    (1...n).each { |i| pref[i] = pref[i-1] + nums[i] }
    ans = []
    (0...n).each do |i|
        left = i > 0 ? pref[i-1] : 0
        right = pref[n-1] - pref[i]
        ans << (right - left + (2*i - n + 1) * nums[i])
    end
    ans
end
