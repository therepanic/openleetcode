# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Integer}
def num_triplets(nums1, nums2)
    def count_pairs(numsA, numsB)
        freq = Hash.new(0)
        (0...numsB.length).each do |i|
            (i+1...numsB.length).each do |j|
                prod = numsB[i] * numsB[j]
                freq[prod] += 1
            end
        end
        count = 0
        numsA.each do |num|
            count += freq[num * num]
        end
        count
    end
    
    count_pairs(nums1, nums2) + count_pairs(nums2, nums1)
end
