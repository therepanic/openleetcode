class Solution {
    func findMinHeightTrees(_ n: Int, _ edges: [[Int]]) -> [Int] {
        if n < 3 {
            return Array(0..<n)
        }

        var adjacencyList = Array(repeating: Set<Int>(), count: n)
        for edge in edges {
            let a = edge[0], b = edge[1]
            adjacencyList[a].insert(b)
            adjacencyList[b].insert(a)
        }

        var leaves = (0..<n).filter { adjacencyList[$0].count == 1 }
        var remainingNodes = n

        while remainingNodes > 2 {
            remainingNodes -= leaves.count
            var newLeaves = [Int]()
            for leaf in leaves {
                let neighbor = adjacencyList[leaf].first!
                adjacencyList[neighbor].remove(leaf)
                if adjacencyList[neighbor].count == 1 {
                    newLeaves.append(neighbor)
                }
            }
            leaves = newLeaves
        }

        return leaves
    }
}
