# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Integer[]}
def advantage_count(nums1, nums2)
    n = nums1.length
    nums1.sort!
    nums2_sorted = nums2.each_with_index.map { |num, idx| [num, idx] }.sort_by { |pair| pair[0] }
    res = Array.new(n, 0)
    
    left, right = 0, n - 1
    (n - 1).downto(0) do |i|
        if nums1[right] > nums2_sorted[i][0]
            res[nums2_sorted[i][1]] = nums1[right]
            right -= 1
        else
            res[nums2_sorted[i][1]] = nums1[left]
            left += 1
        end
    end
    
    res
end
