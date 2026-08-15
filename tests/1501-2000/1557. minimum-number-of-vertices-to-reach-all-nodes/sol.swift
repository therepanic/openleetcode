class Solution {
    func findSmallestSetOfVertices(_ n: Int, _ edges: [[Int]]) -> [Int] {
        var hasIncoming = [Bool](repeating: false, count: n)
        for edge in edges {
            hasIncoming[edge[1]] = true
        }
        var result: [Int] = []
        for i in 0..<n {
            if !hasIncoming[i] {
                result.append(i)
            }
        }
        return result
    }
}
