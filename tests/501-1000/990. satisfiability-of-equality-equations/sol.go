func equationsPossible(equations []string) bool {
    parent := make([]int, 26)
    rank := make([]int, 26)
    for i := 0; i < 26; i++ {
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
        ra := find(a)
        rb := find(b)
        if ra == rb {
            return
        }
        if rank[ra] < rank[rb] {
            parent[ra] = rb
        } else if rank[ra] > rank[rb] {
            parent[rb] = ra
        } else {
            parent[rb] = ra
            rank[ra]++
        }
    }

    for _, eq := range equations {
        if eq[1] == '=' {
            union(int(eq[0]-'a'), int(eq[3]-'a'))
        }
    }

    for _, eq := range equations {
        if eq[1] == '!' && find(int(eq[0]-'a')) == find(int(eq[3]-'a')) {
            return false
        }
    }
    return true
}
