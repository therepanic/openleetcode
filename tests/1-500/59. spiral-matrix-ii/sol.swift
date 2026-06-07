class Solution {
    func generateMatrix(_ n: Int) -> [[Int]] {
        var res = Array(repeating: Array(repeating: 0, count: n), count: n)
        var top = 0
        var bottom = n - 1
        var left = 0
        var right = n - 1
        var val = 1

        while top <= bottom && left <= right {
            for col in left...right {
                res[top][col] = val
                val += 1
            }
            top += 1

            if top <= bottom {
                for row in top...bottom {
                    res[row][right] = val
                    val += 1
                }
            }
            right -= 1

            if top <= bottom {
                if left <= right {
                    for col in stride(from: right, through: left, by: -1) {
                        res[bottom][col] = val
                        val += 1
                    }
                }
                bottom -= 1
            }

            if left <= right && top <= bottom {
                for row in stride(from: bottom, through: top, by: -1) {
                    res[row][left] = val
                    val += 1
                }
                left += 1
            }
        }

        return res
    }
}
