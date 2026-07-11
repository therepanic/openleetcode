# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Integer}
def min_swap(nums1, nums2)
    n = nums1.length
    keep = 0
    swap = 1
    
    for i in 1...n
        inc = nums1[i] > nums1[i - 1] && nums2[i] > nums2[i - 1]
        cross = nums1[i] > nums2[i - 1] && nums2[i] > nums1[i - 1]
        
        if inc && cross
            keep, swap = [keep, swap].min, [keep, swap].min + 1
        elsif inc
            swap += 1
        else
            keep, swap = swap, keep + 1
        end
    end
    
    [keep, swap].min
end
