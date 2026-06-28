class Solution {
    private let MOD = 1_000_000_007

    private func multiply(_ A: [[Int]], _ B: [[Int]]) -> [[Int]] {
        var C = Array(repeating: Array(repeating: 0, count: 3), count: 3)
        for i in 0..<3 {
            for j in 0..<3 {
                var s = 0
                for k in 0..<3 {
                    s = (s + A[i][k] * B[k][j]) % MOD
                }
                C[i][j] = s
            }
        }
        return C
    }

    private func power(_ base: [[Int]], _ exp: Int) -> [[Int]] {
        var result = [[1,0,0],[0,1,0],[0,0,1]]
        var b = base
        var e = exp
        while e > 0 {
            if (e & 1) == 1 {
                result = multiply(result, b)
            }
            b = multiply(b, b)
            e >>= 1
        }
        return result
    }

    func numTilings(_ n: Int) -> Int {
        if n == 0 { return 1 }
        if n == 1 { return 1 }
        if n == 2 { return 2 }
        let t = [[2,0,1],[1,0,0],[0,1,0]]
        let p = power(t, n - 2)
        return (p[0][0] * 2 + p[0][1] + p[0][2]) % MOD
    }
}
