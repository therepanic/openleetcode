class Solution {
    func removeStones(_ stones: [[Int]]) -> Int {
        let n = stones.count
        var matrix = [[Int]](repeating: [], count: n)
        
        for i in 0..<n {
            for j in (i+1)..<n {
                if stones[i][0] == stones[j][0] || stones[i][1] == stones[j][1] {
                    matrix[i].append(j)
                    matrix[j].append(i)
                }
            }
        }
        
        var visited = [Bool](repeating: false, count: n)
        var components = 0
        
        func dfs(_ idx: Int) {
            visited[idx] = true
            for nei in matrix[idx] {
                if !visited[nei] {
                    dfs(nei)
                }
            }
        }
        
        for i in 0..<n {
            if !visited[i] {
                components += 1
                dfs(i)
            }
        }
        
        return n - components
    }
}
