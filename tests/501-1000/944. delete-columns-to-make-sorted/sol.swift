class Solution {
    func minDeletionSize(_ strs: [String]) -> Int {
        let rows = strs.count
        let cols = strs[0].count
        var deletions = 0

        let arr = strs.map { Array($0) }
        for c in 0..<cols {
            for r in 0..<rows - 1 {
                if arr[r][c] > arr[r + 1][c] {
                    deletions += 1
                    break
                }
            }
        }

        return deletions
    }
}
