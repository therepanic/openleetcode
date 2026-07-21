class Solution {
    func countVowelPermutation(_ n: Int) -> Int {
        let MOD = 1000000007
        var a = 1, e = 1, i = 1, o = 1, u = 1
        for _ in 1..<n {
            let na = (e + i + u) % MOD
            let ne = (a + i) % MOD
            let ni = (e + o) % MOD
            let no = i % MOD
            let nu = (i + o) % MOD
            a = na
            e = ne
            i = ni
            o = no
            u = nu
        }
        return (a + e + i + o + u) % MOD
    }
}
