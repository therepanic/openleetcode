func smallestStringWithSwaps(s string, pairs [][]int) string {
    n := len(s)
    parent := make([]int, n)
    for i := 0; i < n; i++ {
        parent[i] = i
    }
    
    var find func(int) int
    find = func(x int) int {
        if parent[x] != x {
            parent[x] = find(parent[x])
        }
        return parent[x]
    }
    
    union := func(x, y int) {
        rx, ry := find(x), find(y)
        if rx != ry {
            parent[rx] = ry
        }
    }
    
    for _, pair := range pairs {
        union(pair[0], pair[1])
    }
    
    groups := make(map[int][]int)
    for i := 0; i < n; i++ {
        root := find(i)
        groups[root] = append(groups[root], i)
    }
    
    res := make([]byte, n)
    for _, indices := range groups {
        chars := make([]byte, len(indices))
        for k, idx := range indices {
            chars[k] = s[idx]
        }
        sort.Ints(indices)
        sort.Slice(chars, func(i, j int) bool { return chars[i] < chars[j] })
        for k, idx := range indices {
            res[idx] = chars[k]
        }
    }
    
    return string(res)
}
