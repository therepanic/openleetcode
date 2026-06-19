import Foundation

class Solution {
    func trapRainWater(_ heightMap: [[Int]]) -> Int {
        guard !heightMap.isEmpty, heightMap.count >= 3, heightMap[0].count >= 3 else {
            return 0
        }

        let m = heightMap.count, n = heightMap[0].count
        var visited = Array(repeating: Array(repeating: false, count: n), count: m)
        var heap = [(Int, Int, Int)]()

        for i in 0..<m {
            heap.append((heightMap[i][0], i, 0))
            heap.append((heightMap[i][n - 1], i, n - 1))
            visited[i][0] = true
            visited[i][n - 1] = true
        }
        for j in 0..<n {
            heap.append((heightMap[0][j], 0, j))
            heap.append((heightMap[m - 1][j], m - 1, j))
            visited[0][j] = true
            visited[m - 1][j] = true
        }

        heap.sort { $0.0 < $1.0 }
        var result = 0
        let directions = [(0, 1), (1, 0), (0, -1), (-1, 0)]

        while !heap.isEmpty {
            heap.sort { $0.0 < $1.0 }
            let (height, x, y) = heap.removeFirst()

            for (dx, dy) in directions {
                let nx = x + dx, ny = y + dy
                if nx >= 0 && nx < m && ny >= 0 && ny < n && !visited[nx][ny] {
                    result += max(0, height - heightMap[nx][ny])
                    heap.append((max(height, heightMap[nx][ny]), nx, ny))
                    visited[nx][ny] = true
                }
            }
        }

        return result
    }
}
