# @param {Integer[]} nums
# @param {Integer} n
# @return {Integer[]}
def shuffle(nums, n)
    ans = Array.new(2 * n, 0)
    (0...2 * n).each do |i|
        if i % 2 == 0
            ans[i] = nums[i / 2]
        else
            ans[i] = nums[n + i / 2]
        end
    end
    ans
end
