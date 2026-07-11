class Solution {
    func findReplaceString(_ s: String, _ indices: [Int], _ sources: [String], _ targets: [String]) -> String {
        var patch = [Int: (String, String)]()
        for k in 0..<indices.count {
            let i = indices[k]
            let src = sources[k]
            let tgt = targets[k]
            let start = s.index(s.startIndex, offsetBy: i)
            let end = s.index(start, offsetBy: src.count, limitedBy: s.endIndex) ?? s.endIndex
            if s[start..<end] == src {
                patch[i] = (src, tgt)
            }
        }
        var res = ""
        var i = 0
        let n = s.count
        while i < n {
            if let (src, tgt) = patch[i] {
                res += tgt
                i += src.count
            } else {
                let idx = s.index(s.startIndex, offsetBy: i)
                res.append(s[idx])
                i += 1
            }
        }
        return res
    }
}
