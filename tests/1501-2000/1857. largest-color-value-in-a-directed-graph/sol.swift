class Solution {
    private var adj: [[Int]] = []
    private var count: [[Int]] = []
    private var vis: [Int] = []
    private var colors: [Character] = []
    private let INF = Int.max
    
    func largestPathValue(_ colors: String, _ edges: [[Int]]) -> Int {
        self.colors = Array(colors)
        let n = self.colors.count
        adj = Array(repeating: [], count: n)
        for e in edges {
            adj[e[0]].append(e[1])
        }
        count = Array(repeating: Array(repeating: 0, count: 26), count: n)
        vis = Array(repeating: 0, count: n)
        
        var ans = 0
        for i in 0..<n {
            let val = dfs(i)
            if val == INF { return -1 }
            ans = max(ans, val)
        }
        return ans
    }
    
    private func dfs(_ node: Int) -> Int {
        if vis[node] == 1 { return INF }
        if vis[node] == 2 { 
            let col = Int(colors[node].asciiValue! - Character("a").asciiValue!)
            return count[node][col] 
        }
        
        vis[node] = 1
        for nxt in adj[node] {
            let res = dfs(nxt)
            if res == INF { return INF }
            for c in 0..<26 {
                count[node][c] = max(count[node][c], count[nxt][c])
            }
        }
        
        let col = Int(colors[node].asciiValue! - Character("a").asciiValue!)
        count[node][col] += 1
        vis[node] = 2
        return count[node][col]
    }
}
