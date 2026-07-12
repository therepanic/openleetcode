class Solution {
    func allPathsSourceTarget(_ graph: [[Int]]) -> [[Int]] {
        let target = graph.count - 1
        var result = [[Int]]()
        var queue: [(Int, [Int])] = [(0, [0])]
        
        while !queue.isEmpty {
            let (node, path) = queue.removeFirst()
            
            if node == target {
                result.append(path)
                continue
            }
            
            for neighbor in graph[node] {
                queue.append((neighbor, path + [neighbor]))
            }
        }
        
        return result
    }
}
