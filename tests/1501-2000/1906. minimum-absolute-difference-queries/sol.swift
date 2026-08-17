class Solution {
    func minDifference(_ nums: [Int], _ queries: [[Int]]) -> [Int] {
        let maxVal = nums.max() ?? 0
        var p = Array(repeating: Array(repeating: 0, count: maxVal + 1), count: nums.count + 1)
        for j in 0...maxVal { p[0][j] = 0 }
        for i in 0..<nums.count {
            for j in 0...maxVal {
                p[i + 1][j] = p[i][j] + (nums[i] == j ? 1 : 0)
            }
        }
        var res = [Int]()
        for q in queries {
            let l = q[0], r = q[1]
            var diff = Array(repeating: 0, count: maxVal + 1)
            for j in 0...maxVal { diff[j] = p[r + 1][j] - p[l][j] }
            var prev = -1
            var best = -1
            for j in 0...maxVal {
                if diff[j] > 0 {
                    if prev >= 0 {
                        if best == -1 || j - prev < best { best = j - prev }
                    }
                    prev = j
                }
            }
            res.append(best)
        }
        return res
    }
}
