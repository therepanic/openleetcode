class Solution {
    func sumOfDistancesInTree(_ n: Int, _ edges: [[Int]]) -> [Int] {
        var adj = [[Int]](repeating: [], count: n)
        for e in edges {
            let u = e[0], v = e[1]
            adj[u].append(v)
            adj[v].append(u)
        }
        
        var count = [Int](repeating: 1, count: n)
        var ans = [Int](repeating: 0, count: n)
        
        func dfsIn(_ node: Int, _ parent: Int) {
            for child in adj[node] {
                if child != parent {
                    dfsIn(child, node)
                    count[node] += count[child]
                    ans[node] += ans[child] + count[child]
                }
            }
        }
        
        func dfsOut(_ node: Int, _ parent: Int) {
            for child in adj[node] {
                if child != parent {
                    ans[child] = ans[node] - count[child] + (n - count[child])
                    dfsOut(child, node)
                }
            }
        }
        
        dfsIn(0, -1)
        dfsOut(0, -1)
        return ans
    }
}
