func minSwapsCouples(row []int) int {
    n := len(row) / 2
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
    
    union := func(a, b int) {
        pa := find(a)
        pb := find(b)
        if pa != pb {
            parent[pa] = pb
        }
    }
    
    for i := 0; i < len(row); i += 2 {
        couple1 := row[i] / 2
        couple2 := row[i+1] / 2
        union(couple1, couple2)
    }
    
    componentSize := make(map[int]int)
    for couple := 0; couple < n; couple++ {
        root := find(couple)
        componentSize[root]++
    }
    
    swaps := 0
    for _, size := range componentSize {
        swaps += size - 1
    }
    
    return swaps
}
