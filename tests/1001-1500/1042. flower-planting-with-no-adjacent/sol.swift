class Solution {
    func gardenNoAdj(_ n: Int, _ paths: [[Int]]) -> [Int] {
        var graph = [Int: [Int]]()
        
        for path in paths {
            let u = path[0]
            let v = path[1]
            graph[u, default: []].append(v)
            graph[v, default: []].append(u)
        }
        
        for node in 1...n {
            if graph[node] == nil {
                graph[node] = []
            }
        }
        
        var answer = [Int](repeating: 0, count: n + 1)
        
        for i in 1...n {
            var used = Set<Int>()
            for nei in graph[i]! {
                used.insert(answer[nei])
            }
            
            for flower in 1...4 {
                if !used.contains(flower) {
                    answer[i] = flower
                    break
                }
            }
        }
        
        return Array(answer[1...])
    }
}
