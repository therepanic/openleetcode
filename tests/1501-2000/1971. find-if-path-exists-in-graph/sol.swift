class Solution {
    func validPath(_ n: Int, _ edges: [[Int]], _ source: Int, _ destination: Int) -> Bool {
        if source == destination { return true }
        var graph = [Int: [Int]]()
        for edge in edges {
            graph[edge[0], default: []].append(edge[1])
            graph[edge[1], default: []].append(edge[0])
        }
        var queue = [source]
        var visited = Set<Int>([source])
        while !queue.isEmpty {
            let node = queue.removeFirst()
            if node == destination { return true }
            for neighbor in graph[node] ?? [] {
                if !visited.contains(neighbor) {
                    visited.insert(neighbor)
                    queue.append(neighbor)
                }
            }
        }
        return false
    }
}
