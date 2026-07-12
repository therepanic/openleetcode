class Solution {
    func eventualSafeNodes(_ graph: [[Int]]) -> [Int] {
        let n = graph.count
        var state = [Int](repeating: 0, count: n) // 0: unvisited, 1: visiting, 2: safe
        var safe = [Int]()
        
        func dfs(_ node: Int) -> Bool {
            if state[node] > 0 {
                return state[node] == 2
            }
            
            state[node] = 1
            
            for neighbor in graph[node] {
                if state[neighbor] == 1 || !dfs(neighbor) {
                    return false
                }
            }
            
            state[node] = 2
            return true
        }
        
        for i in 0..<n {
            if dfs(i) {
                safe.append(i)
            }
        }
        
        return safe
    }
}
