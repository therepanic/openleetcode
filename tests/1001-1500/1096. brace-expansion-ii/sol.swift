class Solution {
    func braceExpansionII(_ expression: String) -> [String] {
        var stack: [[String]] = []
        var res: [String] = []
        var cur: [String] = []
        for v in expression {
            if v.isLetter {
                if cur.isEmpty {
                    cur = [String(v)]
                } else {
                    cur = cur.map { $0 + String(v) }
                }
            } else if v == "{" {
                stack.append(res)
                stack.append(cur)
                res = []
                cur = []
            } else if v == "}" {
                let pre = stack.removeLast()
                let preRes = stack.removeLast()
                let merged = res + cur
                if pre.isEmpty {
                    cur = merged
                } else {
                    cur = pre.flatMap { p in merged.map { p + $0 } }
                }
                res = preRes
            } else if v == "," {
                res.append(contentsOf: cur)
                cur = []
            }
        }
        return Array(Set(res + cur)).sorted()
    }
}
