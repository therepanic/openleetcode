class Solution {
    func tallestBillboard(_ rods: [Int]) -> Int {
        let n = rods.count
        let mid = (n - 1) >> 1
        var left = [(Int, Int)]()
        var right = [(Int, Int)]()
        
        func gen(_ idx: Int, _ end: Int, _ a: Int, _ b: Int, _ vals: inout [(Int, Int)]) {
            if idx == end + 1 {
                vals.append((a - b, b))
                return
            }
            gen(idx + 1, end, a, b, &vals)
            gen(idx + 1, end, a + rods[idx], b, &vals)
            gen(idx + 1, end, a, b + rods[idx], &vals)
        }
        
        gen(0, mid, 0, 0, &left)
        gen(mid + 1, n - 1, 0, 0, &right)
        
        left.sort { $0.0 != $1.0 ? $0.0 < $1.0 : $0.1 > $1.1 }
        right.sort { $0.0 != $1.0 ? $0.0 < $1.0 : $0.1 > $1.1 }
        
        var ans = 0
        let rightDiffs = right.map { $0.0 }
        let rightHeights = right.map { $0.1 }
        
        for (d, b) in left {
            let target = -d
            var lo = 0, hi = rightDiffs.count
            while lo < hi {
                let mid = (lo + hi) >> 1
                if rightDiffs[mid] < target { lo = mid + 1 }
                else { hi = mid }
            }
            if lo < rightDiffs.count && rightDiffs[lo] == target {
                ans = max(ans, b + rightHeights[lo])
            }
        }
        return ans
    }
}
