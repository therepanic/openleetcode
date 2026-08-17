# @param {String[]} nums
# @param {Integer} k
# @return {String}
def kth_largest_number(nums, k)
    arr = nums.map(&:to_i).sort.reverse
    arr[k-1].to_s
end
