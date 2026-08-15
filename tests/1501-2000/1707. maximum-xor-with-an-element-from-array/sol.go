func maximizeXor(nums []int, queries [][]int) []int {
    trie := make([][2]int, 1)
    trie[0] = [2]int{-1, -1}
    insert := func(num int) {
        node := 0
        for i := 31; i >= 0; i-- {
            bit := (num >> i) & 1
            if trie[node][bit] == -1 {
                trie[node][bit] = len(trie)
                trie = append(trie, [2]int{-1, -1})
            }
            node = trie[node][bit]
        }
    }
    maxor := func(num int) int {
        if trie[0][0] == -1 && trie[0][1] == -1 {
            return -1
        }
        node := 0
        ans := 0
        for i := 31; i >= 0; i-- {
            bit := (num >> i) & 1
            opp := 1 - bit
            if trie[node][opp] != -1 {
                ans |= 1 << i
                node = trie[node][opp]
            } else {
                node = trie[node][bit]
            }
        }
        return ans
    }

    sort.Ints(nums)
    type qtype struct {
        m, x, i int
    }
    q := make([]qtype, len(queries))
    for i, qv := range queries {
        q[i] = qtype{qv[1], qv[0], i}
    }
    sort.Slice(q, func(i, j int) bool { return q[i].m < q[j].m })
    res := make([]int, len(queries))
    for i := range res { res[i] = -1 }
    idx := 0
    n := len(nums)
    for _, item := range q {
        for idx < n && nums[idx] <= item.m {
            insert(nums[idx])
            idx++
        }
        res[item.i] = maxor(item.x)
    }
    return res
}
