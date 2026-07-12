class Solution {
    func regionsBySlashes(_ grid: [String]) -> Int {
        let n = grid.count
        var parents = Array(0..<4 * n * n)
        var count = 4 * n * n

        func find(_ x: Int) -> Int {
            if x != parents[x] {
                parents[x] = find(parents[x])
            }
            return parents[x]
        }

        func union(_ x: Int, _ y: Int) -> Bool {
            let rx = find(x)
            let ry = find(y)
            if rx != ry {
                parents[rx] = ry
                return true
            }
            return false
        }

        let merges: [Character: [(Int, Int)]] = [
            " ": [(0, 1), (1, 2), (2, 3)],
            "/": [(0, 3), (1, 2)],
            "\\": [(0, 1), (2, 3)]
        ]

        let gridArr = grid.map { Array($0) }

        for i in 0..<n {
            for j in 0..<n {
                let base = (i * n + j) * 4
                for (u, v) in merges[gridArr[i][j]]! {
                    if union(base + u, base + v) {
                        count -= 1
                    }
                }

                if i + 1 < n {
                    let downBase = ((i + 1) * n + j) * 4
                    if union(base + 2, downBase) {
                        count -= 1
                    }
                }

                if j + 1 < n {
                    let rightBase = (i * n + (j + 1)) * 4
                    if union(base + 1, rightBase + 3) {
                        count -= 1
                    }
                }
            }
        }
        return count
    }
}
