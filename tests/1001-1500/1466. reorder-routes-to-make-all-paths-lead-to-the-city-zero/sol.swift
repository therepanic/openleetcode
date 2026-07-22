class Solution {
    func minReorder(_ n: Int, _ connections: [[Int]]) -> Int {
        var roads = Set<String>()
        var graph = Array(repeating: [Int](), count: n)
        for conn in connections {
            let x = conn[0], y = conn[1]
            graph[x].append(y)
            graph[y].append(x)
            roads.insert("\(x),\(y)")
        }
        
        var seen = Array(repeating: false, count: n)
        seen[0] = true
        
        func dfs(_ node: Int) -> Int {
            var ans = 0
            for neighbor in graph[node] {
                if !seen[neighbor] {
                    if roads.contains("\(node),\(neighbor)") {
                        ans += 1
                    }
                    seen[neighbor] = true
                    ans += dfs(neighbor)
                }
            }
            return ans
        }
        
        return dfs(0)
    }
}
