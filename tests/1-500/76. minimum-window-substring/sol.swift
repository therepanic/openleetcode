class Solution {
    func minWindow(_ s: String, _ t: String) -> String {
        if s.count < t.count || t.isEmpty { return "" }

        var need = [Character: Int]()
        for ch in t {
            need[ch, default: 0] += 1
        }

        let chars = Array(s)
        var missing = t.count
        var left = 0
        var bestL = 0
        var bestLen = Int.max

        for right in 0..<chars.count {
            let ch = chars[right]
            if (need[ch] ?? 0) > 0 { missing -= 1 }
            need[ch, default: 0] -= 1

            while missing == 0 {
                let currLen = right - left + 1
                if currLen < bestLen {
                    bestLen = currLen
                    bestL = left
                }
                let d = chars[left]
                left += 1
                need[d, default: 0] += 1
                if need[d]! > 0 { missing += 1 }
            }
        }

        return bestLen == Int.max ? "" : String(chars[bestL..<bestL + bestLen])
    }
}
