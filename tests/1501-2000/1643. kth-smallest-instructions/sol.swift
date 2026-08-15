class Solution {
    func kthSmallestPath(_ destination: [Int], _ k: Int) -> String {
        var rows = destination[0]
        var cols = destination[1]
        var path = ""
        var kLocal = k - 1

        while rows > 0 || cols > 0 {
            var pathsWithH = 0
            if cols > 0 {
                pathsWithH = combination(rows + cols - 1, cols - 1)
            }

            if kLocal < pathsWithH {
                path.append("H")
                cols -= 1
            } else {
                path.append("V")
                kLocal -= pathsWithH
                rows -= 1
            }
        }
        return path
    }

    private func combination(_ n: Int, _ r: Int) -> Int {
        if r == 0 || r == n { return 1 }
        var rLocal = min(r, n - r)
        var result = 1
        for i in 1...rLocal {
            result = result * (n - rLocal + i) / i
        }
        return result
    }
}
