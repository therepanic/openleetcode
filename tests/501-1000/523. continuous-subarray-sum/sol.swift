class Solution {
    func checkSubarraySum(_ nums: [Int], _ k: Int) -> Bool {
        if nums.isEmpty { return false }

        var prefixSum = 0
        var remainderMap = [0: -1]

        for i in 0..<nums.count {
            prefixSum += nums[i]
            let remainder = prefixSum % k

            if let prevIndex = remainderMap[remainder] {
                if i - prevIndex > 1 { return true }
            } else {
                remainderMap[remainder] = i
            }
        }

        return false
    }
}
