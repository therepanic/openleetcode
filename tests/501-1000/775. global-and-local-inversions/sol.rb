# @param {Integer[]} nums
# @return {Boolean}
def is_ideal_permutation(nums)
    nums.each_with_index do |num, i|
        return false if (num - i).abs > 1
    end
    true
end
