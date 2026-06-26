class Solution {
    func leastBricks(_ wall: [[Int]]) -> Int {
        var edgeCounts = [Int: Int]()
        for row in wall {
            var edge = 0
            for brick in row.dropLast() {
                edge += brick
                edgeCounts[edge, default: 0] += 1
            }
        }
        let maxEdges = edgeCounts.values.max() ?? 0
        return wall.count - maxEdges
    }
}
