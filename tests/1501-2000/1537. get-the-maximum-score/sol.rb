# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Integer}
def max_sum(nums1, nums2)
    p1, p2, sum1, sum2, result = 0, 0, 0, 0, 0
    while p1 < nums1.length && p2 < nums2.length
        if nums1[p1] == nums2[p2]
            result += [sum1, sum2].max + nums1[p1]
            sum1, sum2 = 0, 0
            p1 += 1
            p2 += 1
        elsif nums1[p1] < nums2[p2]
            sum1 += nums1[p1]
            p1 += 1
        else
            sum2 += nums2[p2]
            p2 += 1
        end
    end
    while p1 < nums1.length
        sum1 += nums1[p1]
        p1 += 1
    end
    while p2 < nums2.length
        sum2 += nums2[p2]
        p2 += 1
    end
    (result + [sum1, sum2].max) % (10**9 + 7)
end
