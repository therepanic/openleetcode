# @param {Integer[]} nums
# @return {Integer[]}
def frequency_sort(nums)
    freq = nums.tally
    nums.sort_by { |x| [freq[x], -x] }
end
