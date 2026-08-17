func getCoprimes(nums []int, edges [][]int) []int {
    n := len(nums)
    adj := make([][]int, n)
    for _, e := range edges {
        adj[e[0]] = append(adj[e[0]], e[1])
        adj[e[1]] = append(adj[e[1]], e[0])
    }
    ans := make([]int, n)
    for i := range ans {
        ans[i] = -1
    }
    depth := make([]int, n)
    ancestorByValue := make([]int, 51)
    for i := range ancestorByValue {
        ancestorByValue[i] = -1
    }
    var dfs func(node, prev, dep int)
    dfs = func(node, prev, dep int) {
        depth[node] = dep
        best := int(^uint(0) >> 1)
        bestAnc := -1
        for i := 1; i <= 50; i++ {
            if gcd(i, nums[node]) == 1 {
                anc := ancestorByValue[i]
                if anc != -1 {
                    diff := dep - depth[anc]
                    if diff < best {
                        best = diff
                        bestAnc = anc
                    }
                }
            }
        }
        ans[node] = bestAnc
        prevState := ancestorByValue[nums[node]]
        ancestorByValue[nums[node]] = node
        for _, v := range adj[node] {
            if v != prev {
                dfs(v, node, dep+1)
            }
        }
        ancestorByValue[nums[node]] = prevState
    }
    dfs(0, 0, 0)
    return ans
}

func gcd(a, b int) int {
    for b != 0 {
        a, b = b, a%b
    }
    return a
}
