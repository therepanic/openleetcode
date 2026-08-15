class Solution {
    func numTriplets(_ nums1: [Int], _ nums2: [Int]) -> Int {
        func countPairs(_ numsA: [Int], _ numsB: [Int]) -> Int {
            var freq: [Int: Int] = [:]
            for i in 0..<numsB.count {
                for j in (i+1)..<numsB.count {
                    let prod = numsB[i] * numsB[j]
                    freq[prod, default: 0] += 1
                }
            }
            var count = 0
            for num in numsA {
                count += freq[num * num, default: 0]
            }
            return count
        }
        return countPairs(nums1, nums2) + countPairs(nums2, nums1)
    }
}
