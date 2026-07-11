# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def subarrays_div_by_k(nums, k)
    s = 0
    res = 0
    hs = Hash.new(0)
    hs[0] = 1
    nums.each do |num|
        s += num
        rem = s % k
        res += hs[rem]
        hs[rem] += 1
    end
    res
end
