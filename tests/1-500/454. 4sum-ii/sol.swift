class Solution {
    func fourSumCount(_ nums1: [Int], _ nums2: [Int], _ nums3: [Int], _ nums4: [Int]) -> Int {
        var dict = [Int: Int]()
        for a in nums1 {
            for b in nums2 {
                let sum = a + b
                dict[sum, default: 0] += 1
            }
        }
        var count = 0
        for c in nums3 {
            for d in nums4 {
                count += dict[-(c + d), default: 0]
            }
        }
        return count
    }
}
