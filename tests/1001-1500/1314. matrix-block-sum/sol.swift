class Solution {
    func matrixBlockSum(_ mat: [[Int]], _ k: Int) -> [[Int]] {
        let n = mat.count, m = mat[0].count
        var pre = Array(repeating: Array(repeating: 0, count: m), count: n)
        var ans = Array(repeating: Array(repeating: 0, count: m), count: n)
        
        for i in 0..<n {
            for j in 0..<m {
                var sum = mat[i][j]
                if i - 1 >= 0 { sum += pre[i-1][j] }
                if j - 1 >= 0 { sum += pre[i][j-1] }
                if i - 1 >= 0 && j - 1 >= 0 { sum -= pre[i-1][j-1] }
                pre[i][j] = sum
            }
        }
        
        for i in 0..<n {
            for j in 0..<m {
                let i1 = max(0, i - k)
                let i2 = min(n - 1, i + k)
                let j1 = max(0, j - k)
                let j2 = min(m - 1, j + k)
                var sum = pre[i2][j2]
                if i1 - 1 >= 0 { sum -= pre[i1-1][j2] }
                if j1 - 1 >= 0 { sum -= pre[i2][j1-1] }
                if i1 - 1 >= 0 && j1 - 1 >= 0 { sum += pre[i1-1][j1-1] }
                ans[i][j] = sum
            }
        }
        return ans
    }
}
