class Solution {
    func maxSumTwoNoOverlap(_ nums: [Int], _ firstLen: Int, _ secondLen: Int) -> Int {
        return max(solve(nums, firstLen, secondLen), solve(nums, secondLen, firstLen))
    }

    private func solve(_ nums: [Int], _ firstLen: Int, _ secondLen: Int) -> Int {
        let n = nums.count
        var prefix = [Int](repeating: 0, count: n + 1)
        for i in 0..<n {
            prefix[i + 1] = prefix[i] + nums[i]
        }
        var bestA = prefix[firstLen]
        var ans = 0
        if firstLen + secondLen <= n {
            for end in firstLen + secondLen...n {
                bestA = max(bestA, prefix[end - secondLen] - prefix[end - secondLen - firstLen])
                ans = max(ans, bestA + prefix[end] - prefix[end - secondLen])
            }
        }
        return ans
    }
}
