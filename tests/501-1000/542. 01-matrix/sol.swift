class Solution {
    func updateMatrix(_ mat: [[Int]]) -> [[Int]] {
        var mat = mat
        let rows = mat.count
        let cols = mat[0].count
        let directions = [(0, 1), (0, -1), (1, 0), (-1, 0)]
        var queue = [(Int, Int)]()

        for i in 0..<rows {
            for j in 0..<cols {
                if mat[i][j] == 0 {
                    queue.append((i, j))
                } else {
                    mat[i][j] = Int.max
                }
            }
        }

        while !queue.isEmpty {
            let (row, col) = queue.removeFirst()

            for (dr, dc) in directions {
                let newRow = row + dr
                let newCol = col + dc

                if newRow >= 0 && newRow < rows && newCol >= 0 && newCol < cols && mat[newRow][newCol] > mat[row][col] + 1 {
                    mat[newRow][newCol] = mat[row][col] + 1
                    queue.append((newRow, newCol))
                }
            }
        }

        return mat
    }
}
