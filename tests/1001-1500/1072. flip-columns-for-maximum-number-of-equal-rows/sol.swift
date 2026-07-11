class Solution {
    func maxEqualRowsAfterFlips(_ matrix: [[Int]]) -> Int {
        var count = [String: Int]()
        var ans = 0

        for row in matrix {
            let flip = row[0]
            let key = row.map { String($0 ^ flip) }.joined(separator: ",")
            count[key, default: 0] += 1
            if count[key]! > ans {
                ans = count[key]!
            }
        }

        return ans
    }
}
