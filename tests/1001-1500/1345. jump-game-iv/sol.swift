class Solution {
    func minJumps(_ arr: [Int]) -> Int {
        let n = arr.count
        if n == 1 { return 0 }
        
        var mp = [Int: [Int]]()
        for i in 0..<n {
            mp[arr[i], default: []].append(i)
        }
        
        var q = [(0, 0)]
        var vis = [Bool](repeating: false, count: n)
        vis[0] = true
        
        var head = 0
        while head < q.count {
            let (node, dist) = q[head]
            head += 1
            if node == n - 1 { return dist }
            
            if node - 1 >= 0 && !vis[node - 1] {
                vis[node - 1] = true
                q.append((node - 1, dist + 1))
            }
            if node + 1 < n && !vis[node + 1] {
                vis[node + 1] = true
                q.append((node + 1, dist + 1))
            }
            
            for nxt in mp[arr[node], default: []] {
                if !vis[nxt] {
                    vis[nxt] = true
                    q.append((nxt, dist + 1))
                }
            }
            mp[arr[node]]?.removeAll()
        }
        return -1
    }
}
