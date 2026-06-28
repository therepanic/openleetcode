class Solution {
    func maxSumOfThreeSubarrays(_ nums: [Int], _ k: Int) -> [Int] {
        let n = nums.count
        var prefix = Array(repeating: 0, count: n + 1)
        for i in 0..<n {
            prefix[i + 1] = prefix[i] + nums[i]
        }
        let windowCount = n - k + 1
        var window = Array(repeating: 0, count: windowCount)
        for i in 0..<windowCount {
            window[i] = prefix[i + k] - prefix[i]
        }
        var left = Array(repeating: 0, count: windowCount)
        var best = 0
        for i in 0..<windowCount {
            if window[i] > window[best] {
                best = i
            }
            left[i] = best
        }
        var right = Array(repeating: 0, count: windowCount)
        best = windowCount - 1
        for i in stride(from: windowCount - 1, through: 0, by: -1) {
            if window[i] >= window[best] {
                best = i
            }
            right[i] = best
        }
        var answer = [0, k, 2 * k]
        var maxTotal = -1
        if windowCount >= 3 * k - k + 1 {
            for mid in k..<(windowCount - k) {
                let l = left[mid - k]
                let r = right[mid + k]
                let total = window[l] + window[mid] + window[r]
                if total > maxTotal {
                    maxTotal = total
                    answer = [l, mid, r]
                }
            }
        }
        return answer
    }
}
