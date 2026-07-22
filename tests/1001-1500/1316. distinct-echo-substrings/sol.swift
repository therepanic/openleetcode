class Solution {
    func distinctEchoSubstrings(_ text: String) -> Int {
        let n = text.count
        let b1 = 31
        let b2 = 37
        let m1 = 1000000007
        let m2 = 1000000009
        var p1 = [Int](repeating: 1, count: n + 1)
        var p2 = [Int](repeating: 1, count: n + 1)
        var h1 = [Int](repeating: 0, count: n + 1)
        var h2 = [Int](repeating: 0, count: n + 1)
        let a = Int("a".unicodeScalars.first!.value)
        let chars = Array(text)
        for i in 1...n {
            let v = Int(chars[i - 1].unicodeScalars.first!.value) - a
            p1[i] = (p1[i - 1] * b1) % m1
            p2[i] = (p2[i - 1] * b2) % m2
            h1[i] = (h1[i - 1] * b1 + v) % m1
            h2[i] = (h2[i - 1] * b2 + v) % m2
        }
        func get(_ l: Int, _ r: Int) -> (Int, Int) {
            var v1 = (h1[r] - h1[l] * p1[r - l]) % m1
            var v2 = (h2[r] - h2[l] * p2[r - l]) % m2
            if v1 < 0 { v1 += m1 }
            if v2 < 0 { v2 += m2 }
            return (v1, v2)
        }
        var st = Set<String>()
        for i in 0..<n {
            let maxLen = (n - i) / 2
            if maxLen > 0 {
                for L in 1...maxLen {
                    if get(i, i + L) == get(i + L, i + 2 * L) {
                        let h = get(i, i + 2 * L)
                        st.insert("\(2 * L),\(h.0),\(h.1)")
                    }
                }
            }
        }
        return st.count
    }
}
