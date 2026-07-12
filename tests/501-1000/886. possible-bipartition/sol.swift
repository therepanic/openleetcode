class Solution {
    func possibleBipartition(_ n: Int, _ dislikes: [[Int]]) -> Bool {
        var graph = [Int: [Int]]()
        for edge in dislikes {
            let u = edge[0], v = edge[1]
            graph[u, default: []].append(v)
            graph[v, default: []].append(u)
        }
        
        var color = Array(repeating: 0, count: n + 1)
        
        for node in 1...n {
            if color[node] != 0 || graph[node] == nil {
                continue
            }
            
            var queue = [node]
            color[node] = 1
            
            while !queue.isEmpty {
                let curr = queue.removeFirst()
                
                for neighbor in graph[curr]! {
                    if color[neighbor] == color[curr] {
                        return false
                    }
                    
                    if color[neighbor] == 0 {
                        color[neighbor] = -color[curr]
                        queue.append(neighbor)
                    }
                }
            }
        }
        
        return true
    }
}
