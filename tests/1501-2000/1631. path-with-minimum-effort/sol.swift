class Solution {
    struct Node: Comparable {
        let effort: Int
        let r: Int
        let c: Int
        static func < (a: Node, b: Node) -> Bool { a.effort != b.effort ? a.effort < b.effort : (a.r, a.c) < (b.r, b.c) }
    }
    func minimumEffortPath(_ heights: [[Int]]) -> Int {
        if heights.isEmpty { return 0 }
        let rows = heights.count, cols = heights[0].count
        var pq = Heap<Node>()
        pq.insert(Node(effort: 0, r: 0, c: 0))
        var maxEffort = 0
        var visited = Set<[Int]>()
        let dirs = [[1, 0], [-1, 0], [0, 1], [0, -1]]
        while let curr = pq.popMin() {
            let effort = curr.effort, r = curr.r, c = curr.c
            maxEffort = max(maxEffort, effort)
            if r == rows - 1 && c == cols - 1 { return maxEffort }
            if visited.contains([r, c]) { continue }
            visited.insert([r, c])
            for d in dirs {
                let nr = r + d[0], nc = c + d[1]
                if nr >= 0 && nr < rows && nc >= 0 && nc < cols && !visited.contains([nr, nc]) {
                    let newEffort = abs(heights[nr][nc] - heights[r][c])
                    pq.insert(Node(effort: newEffort, r: nr, c: nc))
                }
            }
        }
        return maxEffort
    }
}
