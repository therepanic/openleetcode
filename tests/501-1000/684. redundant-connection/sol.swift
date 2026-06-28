class Solution {
    func findRedundantConnection(_ edges: [[Int]]) -> [Int] {
        let n = edges.count
        var matrix = [[Int]](repeating: [], count: n + 1)
        for edge in edges {
            let a = edge[0], b = edge[1]
            matrix[a].append(b)
            matrix[b].append(a)
        }

        var visited = Set<Int>()
        var path = Set<Int>()
        var cycleStart = -1

        func dfs(_ i: Int, _ parent: Int) -> Bool {
            if visited.contains(i) { return false }
            visited.insert(i)
            for node in matrix[i] {
                if !visited.contains(node) {
                    if dfs(node, i) {
                        if cycleStart != -1 {
                            path.insert(node)
                        }
                        if node == cycleStart {
                            cycleStart = -1
                        }
                        return true
                    }
                } else if node != parent {
                    path.insert(node)
                    cycleStart = node
                    return true
                }
            }
            return false
        }

        for i in stride(from: n, through: 1, by: -1) {
            if dfs(i, -1) { break }
        }

        for k in stride(from: n - 1, through: 0, by: -1) {
            let a = edges[k][0], b = edges[k][1]
            if path.contains(a) && path.contains(b) {
                return [a, b]
            }
        }
        return []
    }
}
