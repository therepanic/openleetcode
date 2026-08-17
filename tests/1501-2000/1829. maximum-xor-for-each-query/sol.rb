# @param {Integer[]} nums
# @param {Integer} maximum_bit
# @return {Integer[]}
def get_maximum_xor(nums, maximum_bit)
    ans = []
    mask = (1 << maximum_bit) - 1
    curr = 0
    nums.each do |num|
        curr ^= num
        ans.unshift(mask ^ curr)
    end
    ans
end
