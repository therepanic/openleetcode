class Solution {
    func criticalConnections(_ n: Int, _ connections: [[Int]]) -> [[Int]] {
        var graph = [[Int]](repeating: [], count: n)
        for edge in connections {
            let u = edge[0], v = edge[1]
            graph[u].append(v)
            graph[v].append(u)
        }
        
        var disc = [Int](repeating: -1, count: n)
        var low = [Int](repeating: 0, count: n)
        var timer = 0
        var bridges = [[Int]]()
        var iterIdx = [Int](repeating: 0, count: n)
        
        for start in 0..<n {
            if disc[start] != -1 { continue }
            
            var stack = [(node: Int, parent: Int)]()
            disc[start] = timer
            low[start] = timer
            timer += 1
            stack.append((start, -1))
            
            while !stack.isEmpty {
                let top = stack.last!
                let node = top.node, parent = top.parent
                let neighbors = graph[node]
                
                if iterIdx[node] < neighbors.count {
                    let nb = neighbors[iterIdx[node]]
                    iterIdx[node] += 1
                    if nb == parent { continue }
                    
                    if disc[nb] == -1 {
                        disc[nb] = timer
                        low[nb] = timer
                        timer += 1
                        stack.append((nb, node))
                    } else {
                        low[node] = min(low[node], disc[nb])
                    }
                } else {
                    stack.removeLast()
                    if !stack.isEmpty {
                        let par = stack.last!.node
                        low[par] = min(low[par], low[node])
                        if low[node] > disc[par] {
                            bridges.append([par, node])
                        }
                    }
                }
            }
        }
        
        return bridges
    }
}
