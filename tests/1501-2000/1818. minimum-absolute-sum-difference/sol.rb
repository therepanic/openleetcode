# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Integer}
def min_absolute_sum_diff(nums1, nums2)
    mod = 10**9 + 7
    n = nums1.length
    sorted_nums1 = nums1.sort
    total = 0
    max_reduction = 0
    
    n.times do |i|
        a = nums1[i]
        b = nums2[i]
        curr_diff = (a - b).abs
        total += curr_diff
        
        idx = sorted_nums1.bsearch_index { |x| x >= b } || n
        if idx < n
            max_reduction = [max_reduction, curr_diff - (sorted_nums1[idx] - b).abs].max
        end
        if idx > 0
            max_reduction = [max_reduction, curr_diff - (sorted_nums1[idx - 1] - b).abs].max
        end
    end
    
    (total - max_reduction) % mod
end
