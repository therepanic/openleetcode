# @param {Integer[]} nums
# @return {Integer}
def num_identical_pairs(nums)
    pairs = {}
    count = 0
    nums.each do |num|
        if pairs.key?(num)
            count += pairs[num]
        end
        pairs[num] = (pairs[num] || 0) + 1
    end
    count
end
