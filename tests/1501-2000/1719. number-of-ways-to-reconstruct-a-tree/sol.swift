class Solution {
    func checkWays(_ pairs: [[Int]]) -> Int {
        var graph: [Int: Set<Int>] = [:]
        for p in pairs {
            graph[p[0], default: []].insert(p[1])
            graph[p[1], default: []].insert(p[0])
        }
        if graph.isEmpty { return 0 }
        let root = graph.max(by: { $0.value.count < $1.value.count })!.key
        if graph[root]!.count != graph.count - 1 { return 0 }

        var ans = 1
        for (node, neighbors) in graph {
            if node == root { continue }
            let parents = neighbors.filter { graph[$0]!.count >= neighbors.count }
            if parents.isEmpty { return 0 }
            let parent = parents.min(by: { graph[$0]!.count < graph[$1]!.count })!
            var union = graph[parent]!
            union.insert(parent)
            if !union.isSuperset(of: neighbors) { return 0 }
            if neighbors.count == graph[parent]!.count { ans = 2 }
        }
        return ans
    }
}
