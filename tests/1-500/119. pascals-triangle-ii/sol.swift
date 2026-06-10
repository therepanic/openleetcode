
class Solution {
    func getRow(_ rowIndex: Int) -> [Int] {
        var row = [1]
        if rowIndex == 0 { return row }
        for _ in 0..<rowIndex {
            var next = Array(repeating: 1, count: row.count + 1)
            if row.count >= 2 {
                for j in 1..<row.count {
                    next[j] = row[j - 1] + row[j]
                }
            }
            row = next
        }
        return row
    }
}
