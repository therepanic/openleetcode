# @param {Integer[]} nums
# @return {Integer}
def min_start_value(nums)
    curr = ans = 0
    nums.each do |i|
        curr += i
        if curr < ans
            ans = curr
        end
    end
    [ans, 1 - ans].max
end
