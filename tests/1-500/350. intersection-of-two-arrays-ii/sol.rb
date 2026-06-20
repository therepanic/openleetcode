# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Integer[]}
def intersect(nums1, nums2)
    counts = Hash.new(0)
    nums1.each { |num| counts[num] += 1 }
    result = []

    nums2.each do |num|
        if counts[num] > 0
            result << num
            counts[num] -= 1
        end
    end

    result
end
