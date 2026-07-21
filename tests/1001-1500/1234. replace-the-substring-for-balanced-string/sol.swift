class Solution {
    func balancedString(_ s: String) -> Int {
        let n = s.count
        let each = n / 4
        let chars = Array(s)
        var count = [Character: Int]()
        for c in chars {
            count[c, default: 0] += 1
        }
        var extra = [Character: Int]()
        for (k, v) in count {
            if v > each {
                extra[k] = v - each
            }
        }
        if extra.isEmpty { return 0 }
        var left = 0
        var res = Int.max
        var curr = [Character: Int]()
        for right in 0..<n {
            let rc = chars[right]
            if extra[rc] != nil {
                curr[rc, default: 0] += 1
            }
            var allMet: Bool {
                for (k, v) in extra {
                    if curr[k, default: 0] < v { return false }
                }
                return true
            }
            while allMet && left <= right {
                res = min(res, right - left + 1)
                let lc = chars[left]
                if curr[lc] != nil {
                    curr[lc]! -= 1
                    if curr[lc]! == 0 {
                        curr.removeValue(forKey: lc)
                    }
                }
                left += 1
            }
        }
        return res
    }
}
