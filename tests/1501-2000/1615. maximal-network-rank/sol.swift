class Solution {
    func maximalNetworkRank(_ n: Int, _ roads: [[Int]]) -> Int {
        var a = Array(repeating: Array(repeating: 0, count: n), count: n)
        for road in roads {
            a[road[0]][road[1]] = 1
            a[road[1]][road[0]] = 1
        }
        
        let d = a.map { row in row.reduce(0, +) }
        
        var rank = Array(repeating: Array(repeating: -1, count: n), count: n)
        for i in 0..<n {
            for j in 0..<n {
                if i != j {
                    rank[i][j] = d[i] + d[j] - a[i][j]
                }
            }
        }
        
        return rank.flatMap { $0 }.max() ?? -1
    }
}
