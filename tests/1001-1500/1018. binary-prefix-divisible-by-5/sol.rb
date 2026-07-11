# @param {Integer[]} nums
# @return {Boolean[]}
def prefixes_div_by5(nums)
    ans = []
    val = 0
    nums.each do |bit|
        val = (val * 2 + bit) % 5
        ans << (val == 0)
    end
    ans
end
