class Solution {
    func oddCells(_ m: Int, _ n: Int, _ indices: [[Int]]) -> Int {
        var a = Array(repeating: Array(repeating: 0, count: n), count: m)
        var c = 0
        for k in indices {
            for u in 0..<n {
                a[k[0]][u] += 1
            }
            for l in 0..<m {
                a[l][k[1]] += 1
            }
        }
        for i in 0..<m {
            for j in 0..<n {
                if a[i][j] % 2 != 0 {
                    c += 1
                }
            }
        }
        return c
    }
}
