# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @param {Integer[]} nums3
# @param {Integer[]} nums4
# @return {Integer}
def four_sum_count(nums1, nums2, nums3, nums4)
    d = Hash.new(0)
    nums1.each do |a|
        nums2.each do |b|
            d[a + b] += 1
        end
    end
    count = 0
    nums3.each do |c|
        nums4.each do |d2|
            count += d[-(c + d2)]
        end
    end
    count
end
