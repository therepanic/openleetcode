class Solution {
    func longestDupSubstring(_ s: String) -> String {
        let n = s.count
        let base1 = 131
        let base2 = 31
        let mod1 = 1000000005
        let mod2 = 1000000007
        let chars = Array(s.utf8)

        var h1 = [Int](repeating: 0, count: n + 1)
        var p1 = [Int](repeating: 1, count: n + 1)
        var h2 = [Int](repeating: 0, count: n + 1)
        var p2 = [Int](repeating: 1, count: n + 1)

        for i in 0..<n {
            h1[i + 1] = (h1[i] * base1 + Int(chars[i])) % mod1
            p1[i + 1] = (p1[i] * base1) % mod1
            h2[i + 1] = (h2[i] * base2 + Int(chars[i])) % mod2
            p2[i + 1] = (p2[i] * base2) % mod2
        }

        func check(_ L: Int) -> String {
            var seen = Set<Int>()
            for i in 0...(n - L) {
                var v1 = (h1[i + L] - h1[i] * p1[L]) % mod1
                if v1 < 0 { v1 += mod1 }
                var v2 = (h2[i + L] - h2[i] * p2[L]) % mod2
                if v2 < 0 { v2 += mod2 }
                let key = v1 * mod2 + v2
                if seen.contains(key) {
                    let start = s.index(s.startIndex, offsetBy: i)
                    let end = s.index(start, offsetBy: L)
                    return String(s[start..<end])
                }
                seen.insert(key)
            }
            return ""
        }

        var lo = 1, hi = n, res = ""
        while lo <= hi {
            let mid = (lo + hi) / 2
            let t = check(mid)
            if !t.isEmpty {
                res = t
                lo = mid + 1
            } else {
                hi = mid - 1
            }
        }
        return res
    }
}
