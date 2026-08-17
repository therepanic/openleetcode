# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Integer}
def min_operations(nums1, nums2)
    x = nums1.sum
    y = nums2.sum
    return 0 if x == y
    if x < y
        return -1 if 6*nums1.length < nums2.length
        gains = nums1.map { |v| 6-v } + nums2.map { |v| v-1 }
        gains.sort! { |a,b| b <=> a }
        diff = y - x
        ops = 0
        gains.each do |g|
            break if diff <= 0
            diff -= g
            ops += 1
        end
        return diff <= 0 ? ops : -1
    else
        return -1 if 6*nums2.length < nums1.length
        gains = nums1.map { |v| v-1 } + nums2.map { |v| 6-v }
        gains.sort! { |a,b| b <=> a }
        diff = x - y
        ops = 0
        gains.each do |g|
            break if diff <= 0
            diff -= g
            ops += 1
        end
        return diff <= 0 ? ops : -1
    end
end
