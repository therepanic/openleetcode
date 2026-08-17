# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Integer}
def max_distance(nums1, nums2)
    i = 0
    j = 0
    ans = 0
    while i < nums1.length && j < nums2.length
        if nums1[i] <= nums2[j]
            ans = [ans, j - i].max
            j += 1
        else
            i += 1
            if i > j
                j = i
            end
        end
    end
    ans
end
