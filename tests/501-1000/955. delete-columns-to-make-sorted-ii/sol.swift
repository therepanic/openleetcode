class Solution {
    func minDeletionSize(_ strs: [String]) -> Int {
        let n = strs.count
        let m = strs[0].count
        var sortedPairs = [Bool](repeating: false, count: n - 1)
        var delCount = 0
        let strsArr = strs.map { Array($0) }

        for col in 0..<m {
            var bad = false
            for i in 0..<n - 1 {
                if !sortedPairs[i] && strsArr[i][col] > strsArr[i + 1][col] {
                    bad = true
                    break
                }
            }

            if bad {
                delCount += 1
                continue
            }

            for i in 0..<n - 1 {
                if !sortedPairs[i] && strsArr[i][col] < strsArr[i + 1][col] {
                    sortedPairs[i] = true
                }
            }

            if sortedPairs.allSatisfy({ $0 }) {
                break
            }
        }

        return delCount
    }
}
