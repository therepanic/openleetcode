func waysToBuildRooms(prevRoom []int) int {
    const MOD = 1000000007
    n := len(prevRoom)
    tree := make([][]int, n)
    for i := 1; i < n; i++ {
        tree[prevRoom[i]] = append(tree[prevRoom[i]], i)
    }
    fact := make([]int64, n+1)
    invFact := make([]int64, n+1)
    fact[0] = 1
    for i := 1; i <= n; i++ {
        fact[i] = fact[i-1] * int64(i) % MOD
    }
    invFact[n] = powMod(fact[n], int64(MOD-2), int64(MOD))
    for i := n; i > 0; i-- {
        invFact[i-1] = invFact[i] * int64(i) % MOD
    }
    ways := make([]int64, n)
    size := make([]int, n)
    var dfs func(int)
    dfs = func(node int) {
        ways[node] = 1
        size[node] = 1
        for _, child := range tree[node] {
            dfs(child)
            oldSize := size[node]
            size[node] += size[child]
            ways[node] = ways[node] * comb(int64(size[node]-1), int64(oldSize-1), fact, invFact, int64(MOD)) % MOD
            ways[node] = ways[node] * ways[child] % MOD
        }
    }
    dfs(0)
    return int(ways[0])
}

func comb(n, k int64, fact, invFact []int64, mod int64) int64 {
    if k < 0 || k > n {
        return 0
    }
    return fact[n] * invFact[k] % mod * invFact[n-k] % mod
}

func powMod(a, b, mod int64) int64 {
    res := int64(1)
    for b > 0 {
        if b&1 == 1 {
            res = res * a % mod
        }
        a = a * a % mod
        b >>= 1
    }
    return res
}
