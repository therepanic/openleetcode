class Solution {
    func bestRotation(_ nums: [Int]) -> Int {
        let n = nums.count
        var diffs = [Int](repeating: 0, count: n + 1)
        for i in 0..<n {
            let left = ((i - nums[i] + 1) % n + n) % n
            let right = (i + 1) % n
            diffs[left] -= 1
            diffs[right] += 1
            if left > right {
                diffs[0] -= 1
            }
        }
        var best = 0
        var cur = n
        var maxScore = cur
        for k in 1..<n {
            cur += diffs[k]
            if cur > maxScore {
                maxScore = cur
                best = k
            }
        }
        return best
    }
}
