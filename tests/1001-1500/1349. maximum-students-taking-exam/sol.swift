class Solution {
    func maxStudents(_ seats: [[Character]]) -> Int {
        let m = seats.count
        let n = seats[0].count
        var available = [Int]()
        for row in seats {
            var mask = 0
            for (col, seat) in row.enumerated() {
                if seat == "." {
                    mask |= 1 << col
                }
            }
            available.append(mask)
        }

        var validMasks = [Int]()
        for mask in 0..<(1 << n) {
            if (mask & (mask << 1)) == 0 {
                validMasks.append(mask)
            }
        }

        var dp = [0: 0]
        for row in 0..<m {
            var nextDp = [Int: Int]()
            for current in validMasks {
                if (current & ~available[row]) != 0 { continue }
                let count = current.nonzeroBitCount
                for (previous, total) in dp {
                    if (current & ((previous << 1) | (previous >> 1))) != 0 { continue }
                    nextDp[current] = max(nextDp[current, default: 0], total + count)
                }
            }
            dp = nextDp
        }

        return dp.values.max() ?? 0
    }
}
