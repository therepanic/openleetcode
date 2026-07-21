class Solution {
    func maxSideLength(_ mat: [[Int]], _ threshold: Int) -> Int {
        let n = mat.count
        let m = mat[0].count
        var pref = mat
        for i in 0..<n {
            for j in 1..<m {
                pref[i][j] += pref[i][j - 1]
            }
        }
        for j in 0..<m {
            for i in 1..<n {
                pref[i][j] += pref[i - 1][j]
            }
        }
        func isValid(_ k: Int) -> Bool {
            for i in (k - 1)..<n {
                for j in (k - 1)..<m {
                    let x1 = i - k + 1
                    let y1 = j - k + 1
                    var total = pref[i][j]
                    if x1 > 0 { total -= pref[x1 - 1][j] }
                    if y1 > 0 { total -= pref[i][y1 - 1] }
                    if x1 > 0 && y1 > 0 { total += pref[x1 - 1][y1 - 1] }
                    if total <= threshold { return true }
                }
            }
            return false
        }
        var low = 1, high = min(n, m)
        var ans = 0
        while low <= high {
            let mid = (low + high) / 2
            if isValid(mid) {
                ans = mid
                low = mid + 1
            } else {
                high = mid - 1
            }
        }
        return ans
    }
}
