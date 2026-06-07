class Solution {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        var res = [Int]()
        var top = 0
        var bottom = matrix.count - 1
        var left = 0
        var right = matrix[0].count - 1

        while top <= bottom && left <= right {
            for col in left...right {
                res.append(matrix[top][col])
            }
            top += 1

            if top <= bottom {
                for row in top...bottom {
                    res.append(matrix[row][right])
                }
            }
            right -= 1

            if top <= bottom {
                if left <= right {
                    for col in stride(from: right, through: left, by: -1) {
                        res.append(matrix[bottom][col])
                    }
                }
                bottom -= 1
            }

            if left <= right && top <= bottom {
                for row in stride(from: bottom, through: top, by: -1) {
                    res.append(matrix[row][left])
                }
                left += 1
            }
        }

        return res
    }
}
