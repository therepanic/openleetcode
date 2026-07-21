class Solution {
    func findTheCity(_ n: Int, _ edges: [[Int]], _ distanceThreshold: Int) -> Int {
        let INF = Int.max / 2
        var matrix = Array(repeating: Array(repeating: INF, count: n), count: n)
        
        for i in 0..<n {
            matrix[i][i] = 0
        }
        
        for edge in edges {
            let u = edge[0], v = edge[1], w = edge[2]
            matrix[u][v] = w
            matrix[v][u] = w
        }
        
        for via in 0..<n {
            for i in 0..<n {
                for j in 0..<n {
                    if matrix[i][via] + matrix[via][j] < matrix[i][j] {
                        matrix[i][j] = matrix[i][via] + matrix[via][j]
                    }
                }
            }
        }
        
        var minReachable = n
        var ans = -1
        
        for i in 0..<n {
            var count = 0
            for j in 0..<n {
                if matrix[i][j] <= distanceThreshold {
                    count += 1
                }
            }
            if count <= minReachable {
                minReachable = count
                ans = i
            }
        }
        
        return ans
    }
}
