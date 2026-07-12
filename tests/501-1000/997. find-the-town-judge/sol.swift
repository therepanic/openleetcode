class Solution {
    func findJudge(_ n: Int, _ trust: [[Int]]) -> Int {
        var indegree = [Int](repeating: 0, count: n + 1)
        var outdegree = [Int](repeating: 0, count: n + 1)
        for edge in trust {
            let a = edge[0]
            let b = edge[1]
            outdegree[a] += 1
            indegree[b] += 1
        }
        for i in 1...n {
            if outdegree[i] == 0 && indegree[i] == n - 1 {
                return i
            }
        }
        return -1
    }
}
