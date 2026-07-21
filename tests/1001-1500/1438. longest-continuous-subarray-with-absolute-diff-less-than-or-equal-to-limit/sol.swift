class Solution {
    func longestSubarray(_ nums: [Int], _ limit: Int) -> Int {
        var maxq = [Int]()
        var minq = [Int]()
        var left = 0
        var max_len = 1
        for right in 0..<nums.count {
            while !maxq.isEmpty && nums[maxq.last!] <= nums[right] {
                maxq.removeLast()
            }
            maxq.append(right)
            while !minq.isEmpty && nums[minq.last!] >= nums[right] {
                minq.removeLast()
            }
            minq.append(right)
            while nums[maxq.first!] - nums[minq.first!] > limit {
                left += 1
                if maxq.first! < left {
                    maxq.removeFirst()
                }
                if minq.first! < left {
                    minq.removeFirst()
                }
            }
            max_len = max(max_len, right - left + 1)
        }
        return max_len
    }
}
