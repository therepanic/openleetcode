class Solution {
    func maxSumSubmatrix(_ matrix: [[Int]], _ k: Int) -> Int {
        let m = matrix.count
        let n = matrix[0].count
        var ans = Int.min
        for left in 0..<n {
            var rowSum = [Int](repeating: 0, count: m)
            for right in left..<n {
                for i in 0..<m {
                    rowSum[i] += matrix[i][right]
                }
                var s = [0]
                var curr = 0
                for x in rowSum {
                    curr += x
                    let target = curr - k
                    var lo = 0, hi = s.count
                    while lo < hi {
                        let mid = lo + (hi - lo) / 2
                        if s[mid] < target {
                            lo = mid + 1
                        } else {
                            hi = mid
                        }
                    }
                    if lo < s.count {
                        ans = max(ans, curr - s[lo])
                    }
                    lo = 0
                    hi = s.count
                    while lo < hi {
                        let mid = lo + (hi - lo) / 2
                        if s[mid] < curr {
                            lo = mid + 1
                        } else {
                            hi = mid
                        }
                    }
                    s.insert(curr, at: lo)
                }
            }
        }
        return ans
    }
}
