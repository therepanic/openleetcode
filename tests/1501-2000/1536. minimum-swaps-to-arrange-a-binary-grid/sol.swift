class Solution {
    func minSwaps(_ grid: [[Int]]) -> Int {
        let n = grid.count
        var zeros = [Int](repeating: 0, count: n)
        for i in 0..<n {
            var count = 0
            for j in stride(from: n - 1, through: 0, by: -1) {
                if grid[i][j] == 0 {
                    count += 1
                } else {
                    break
                }
            }
            zeros[i] = count
        }
        var swaps = 0
        for i in 0..<n {
            let needed = n - i - 1
            var j = i
            while j < n && zeros[j] < needed {
                j += 1
            }
            if j == n {
                return -1
            }
            while j > i {
                zeros.swapAt(j, j - 1)
                j -= 1
                swaps += 1
            }
        }
        return swaps
    }
}
