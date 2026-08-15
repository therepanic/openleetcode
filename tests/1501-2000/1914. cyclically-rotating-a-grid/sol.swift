class Solution {

    func rotateGrid(_ grid: [[Int]], _ k: Int) -> [[Int]] {

        var grid = grid

        var t = 0

        var l = 0

        var b = grid.count - 1

        var r = grid[0].count - 1

        while t < b && l < r {

            let ln = b - t

            let wid = r - l

            let perimeter = 2 * ln + 2 * wid

            var steps = k % perimeter

            while steps > 0 {

                let tmp = grid[t][l]

                for i in l..<r {

                    grid[t][i] = grid[t][i + 1]

                }

                for i in t..<b {

                    grid[i][r] = grid[i + 1][r]

                }

                for i in stride(from: r, through: l + 1, by: -1) {

                    grid[b][i] = grid[b][i - 1]

                }

                for i in stride(from: b, through: t + 1, by: -1) {

                    grid[i][l] = grid[i - 1][l]

                }

                grid[t + 1][l] = tmp

                steps -= 1

            }

            t += 1

            l += 1

            b -= 1

            r -= 1

        }

        return grid

    }

}
