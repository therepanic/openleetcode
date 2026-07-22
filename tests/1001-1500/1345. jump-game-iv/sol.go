func minJumps(arr []int) int {
    n := len(arr)
    if n == 1 {
        return 0
    }
    
    mp := make(map[int][]int)
    for i, v := range arr {
        mp[v] = append(mp[v], i)
    }
    
    q := [][]int{{0, 0}}
    vis := make([]bool, n)
    vis[0] = true
    
    for len(q) > 0 {
        node, dist := q[0][0], q[0][1]
        q = q[1:]
        if node == n-1 {
            return dist
        }
        
        if node-1 >= 0 && !vis[node-1] {
            vis[node-1] = true
            q = append(q, []int{node - 1, dist + 1})
        }
        if node+1 < n && !vis[node+1] {
            vis[node+1] = true
            q = append(q, []int{node + 1, dist + 1})
        }
        
        for _, nxt := range mp[arr[node]] {
            if !vis[nxt] {
                vis[nxt] = true
                q = append(q, []int{nxt, dist + 1})
            }
        }
        mp[arr[node]] = nil
    }
    return -1
}
