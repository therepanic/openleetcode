# @param {Integer[]} nums
# @return {Integer[]}
def product_except_self(nums)
    n = nums.length
    res = Array.new(n, 0)

    pre = 1
    (0...n).each do |i|
        res[i] = pre
        pre *= nums[i]
    end

    suf = 1
    (n - 1).downto(0) do |i|
        res[i] *= suf
        suf *= nums[i]
    end

    res
end
