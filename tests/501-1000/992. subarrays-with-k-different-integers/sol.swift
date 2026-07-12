class Solution {
    func subarraysWithKDistinct(_ nums: [Int], _ k: Int) -> Int {
        func atMost(_ k: Int) -> Int {
            var freq = [Int: Int]()
            var count = 0
            var left = 0
            let n = nums.count

            for right in 0..<n {
                freq[nums[right], default: 0] += 1

                while freq.count > k {
                    if freq[nums[left]]! > 1 {
                        freq[nums[left]]! -= 1
                    } else {
                        freq.removeValue(forKey: nums[left])
                    }
                    left += 1
                }

                count += (right - left + 1)
            }

            return count
        }

        return atMost(k) - atMost(k - 1)
    }
}
