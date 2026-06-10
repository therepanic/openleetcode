class Solution {
    func isIsomorphic(_ s: String, _ t: String) -> Bool {
        let sa = Array(s.utf8)
        let ta = Array(t.utf8)
        var st = Array(repeating: -1, count: 256)
        var ts = Array(repeating: -1, count: 256)
        for i in 0..<sa.count {
            let a = Int(sa[i]), b = Int(ta[i])
            if st[a] != ts[b] { return false }
            st[a] = i
            ts[b] = i
        }
        return true
    }
}
