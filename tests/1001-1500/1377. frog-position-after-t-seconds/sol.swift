class Solution {
    func frogPosition(_ n: Int, _ edges: [[Int]], _ t: Int, _ target: Int) -> Double {
        var neighbors = [Int: Set<Int>]()
        for i in 1...n {
            neighbors[i] = Set<Int>()
        }
        for edge in edges {
            let a = edge[0], b = edge[1]
            neighbors[a]!.insert(b)
            neighbors[b]!.insert(a)
        }
        
        var visited = Set<Int>()
        var probability = 0.0
        
        func dfs(_ vertex: Int, _ chance: Double, _ elapsed: Int) {
            if elapsed == t {
                if vertex == target {
                    probability = chance
                }
                return
            }
            visited.insert(vertex)
            let choices = neighbors[vertex]!.subtracting(visited)
            
            if choices.isEmpty {
                dfs(vertex, chance, elapsed + 1)
            } else {
                for child in choices {
                    dfs(child, chance / Double(choices.count), elapsed + 1)
                }
            }
        }
        
        dfs(1, 1.0, 0)
        return probability
    }
}
