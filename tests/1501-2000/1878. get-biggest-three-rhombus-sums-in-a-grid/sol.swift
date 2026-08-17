class Solution {
    func getBiggestThree(_ grid: [[Int]]) -> [Int] {
        let m = grid.count
        let n = grid[0].count
        let maxD = (min(m, n) - 1) / 2
        var result: [Int] = []
        var seen = Set<Int>()
        for d in 0...maxD {
            for i in d..<(m-d) {
                for j in d..<(n-d) {
                    let val = diamondSum(grid, i, j, d)
                    if seen.insert(val).inserted {
                        result.append(val)
                    }
                }
            }
        }
        result.sort(by: >)
        return Array(result.prefix(3))
    }
    
    private func diamondSum(_ grid: [[Int]], _ i: Int, _ j: Int, _ d: Int) -> Int {
        if d == 0 { return grid[i][j] }
        var sum = 0
        for t in 0...d { sum += grid[i - d + t][j + t] }
        for t in 1...d { sum += grid[i + t][j + d - t] }
        for t in 1...d { sum += grid[i + d - t][j - t] }
        for t in 1..<d { sum += grid[i - t][j - d + t] }
        return sum
    }
}
