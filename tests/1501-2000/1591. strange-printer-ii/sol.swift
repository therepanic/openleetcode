class Solution {
    func isPrintable(_ targetGrid: [[Int]]) -> Bool {
        var grid = targetGrid
        let m = grid.count, n = grid[0].count
        var colors: [Int: [(Int, Int)]] = [:]
        for i in 0..<m {
            for j in 0..<n {
                colors[grid[i][j], default: []].append((i, j))
            }
        }
        
        func canRemove(_ color: Int) -> Bool {
            guard let pos = colors[color] else { return false }
            var mnR = pos[0].0, mxR = pos[0].0
            var mnC = pos[0].1, mxC = pos[0].1
            for (r, c) in pos {
                mnR = min(mnR, r)
                mxR = max(mxR, r)
                mnC = min(mnC, c)
                mxC = max(mxC, c)
            }
            for i in mnR...mxR {
                for j in mnC...mxC {
                    if grid[i][j] != color && grid[i][j] > 0 { return false }
                }
            }
            for i in mnR...mxR {
                for j in mnC...mxC {
                    grid[i][j] = 0
                }
            }
            return true
        }
        
        var colorSet = Set(colors.keys)
        while !colorSet.isEmpty {
            let removable = colorSet.filter { canRemove($0) }
            if removable.isEmpty { return false }
            colorSet.subtract(removable)
        }
        return true
    }
}
