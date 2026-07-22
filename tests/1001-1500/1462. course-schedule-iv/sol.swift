class Solution {
    func checkIfPrerequisite(_ n: Int, _ prerequisites: [[Int]], _ queries: [[Int]]) -> [Bool] {
        var reach = Array(repeating: Array(repeating: false, count: n), count: n)
        for edge in prerequisites { reach[edge[0]][edge[1]] = true }
        for k in 0..<n {
            for i in 0..<n where reach[i][k] {
                for j in 0..<n { reach[i][j] = reach[i][j] || reach[k][j] }
            }
        }
        return queries.map { reach[$0[0]][$0[1]] }
    }
}
