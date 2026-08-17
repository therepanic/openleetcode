func minimumHammingDistance(source []int, target []int, allowedSwaps [][]int) int {
    n := len(source)
    parent := make([]int, n)
    for i := range parent {
        parent[i] = i
    }
    
    var find func(int) int
    find = func(x int) int {
        if parent[x] != x {
            parent[x] = find(parent[x])
        }
        return parent[x]
    }
    
    unite := func(a, b int) {
        parent[find(a)] = find(b)
    }
    
    for _, swap := range allowedSwaps {
        unite(swap[0], swap[1])
    }
    
    groups := make(map[int][]int)
    for i := 0; i < n; i++ {
        root := find(i)
        groups[root] = append(groups[root], source[i])
    }
    freqMap := make(map[int]map[int]int)
    for root, vals := range groups {
        freq := make(map[int]int)
        for _, v := range vals {
            freq[v]++
        }
        freqMap[root] = freq
    }
    
    hammingDist := 0
    for i := 0; i < n; i++ {
        root := find(i)
        freq := freqMap[root]
        val := target[i]
        if freq[val] > 0 {
            freq[val]--
        } else {
            hammingDist++
        }
    }
    return hammingDist
}
