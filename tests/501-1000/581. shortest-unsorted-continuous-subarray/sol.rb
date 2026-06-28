# @param {Integer[]} nums
# @return {Integer}
def find_unsorted_subarray(nums)
    sorted_nums = nums.sort
    start = nums.length
    end_idx = 0

    nums.each_with_index do |num, i|
        if num != sorted_nums[i]
            start = [start, i].min
            end_idx = [end_idx, i].max
        end
    end

    end_idx - start >= 0 ? end_idx - start + 1 : 0
end
