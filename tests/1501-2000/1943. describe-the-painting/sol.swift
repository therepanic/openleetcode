class Solution {
    func splitPainting(_ segments: [[Int]]) -> [[Int]] {
        var events: [(Int, Int)] = []
        for seg in segments {
            events.append((seg[0], seg[2]))
            events.append((seg[1], -seg[2]))
        }
        events.sort { $0.0 < $1.0 }
        
        var ans: [[Int]] = []
        var prev = -1
        var mix = 0
        for (pos, val) in events {
            if prev != -1 {
                if pos != prev && mix != 0 {
                    ans.append([prev, pos, mix])
                }
            }
            prev = pos
            mix += val
        }
        return ans
    }
}
