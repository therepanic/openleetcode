class Solution {
    func smallestRange(_ nums: [[Int]]) -> [Int] {
        var values: [(Int, Int)] = []
        for (listIdx, row) in nums.enumerated() {
            for value in row {
                values.append((value, listIdx))
            }
        }
        values.sort { $0.0 == $1.0 ? $0.1 < $1.1 : $0.0 < $1.0 }

        var freq: [Int: Int] = [:]
        var covered = 0
        var left = 0
        var best = [values[0].0, values[values.count - 1].0]

        for right in 0..<values.count {
            let listIdx = values[right].1
            if (freq[listIdx] ?? 0) == 0 {
                covered += 1
            }
            freq[listIdx, default: 0] += 1

            while covered == nums.count {
                let currentLeft = values[left].0
                let currentRight = values[right].0
                if currentRight - currentLeft < best[1] - best[0] ||
                    (currentRight - currentLeft == best[1] - best[0] && currentLeft < best[0]) {
                    best = [currentLeft, currentRight]
                }
                let leftList = values[left].1
                freq[leftList]! -= 1
                if freq[leftList] == 0 {
                    covered -= 1
                }
                left += 1
            }
        }
        return best
    }
}
