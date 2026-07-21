class Solution {
    func dieSimulator(_ n: Int, _ rollMax: [Int]) -> Int {
        let MOD = 1_000_000_007
        let faces = 6

        var f = Array(repeating: Array(repeating: 0, count: faces), count: n)
        var s = Array(repeating: 0, count: n)

        for j in 0..<faces {
            f[0][j] = 1
        }
        s[0] = faces

        for i in 1..<n {
            for j in 0..<faces {
                let maxRepeat = rollMax[j]
                var res = s[i - 1]

                if i > maxRepeat {
                    res -= (s[i - maxRepeat - 1] - f[i - maxRepeat - 1][j])
                } else if i == maxRepeat {
                    res -= 1
                }

                f[i][j] = ((res % MOD) + MOD) % MOD
            }

            var sum = 0
            for j in 0..<faces {
                sum = (sum + f[i][j]) % MOD
            }
            s[i] = sum
        }

        return s[n - 1]
    }
}
