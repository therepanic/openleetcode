func busiestServers(k int, arrival []int, load []int) []int {
    available := make([]int, 0, k)
    for i := 0; i < k; i++ {
        available = append(available, i)
    }
    sort.Ints(available)
    busy := make([][2]int, 0)
    res := make([]int, k)
    for i, a := range arrival {
        // remove finished
        for len(busy) > 0 && busy[0][0] <= a {
            x := busy[0][1]
            busy = busy[1:]
            available = append(available, i+((x-i)%k+k)%k)
            sort.Ints(available)
        }
        if len(available) > 0 {
            j := available[0] % k
            available = available[1:]
            busy = append(busy, [2]int{a + load[i], j})
            sort.Slice(busy, func(a, b int) bool { return busy[a][0] < busy[b][0] })
            res[j]++
        }
    }
    max := 0
    for _, r := range res {
        if r > max {
            max = r
        }
    }
    ans := []int{}
    for i, r := range res {
        if r == max {
            ans = append(ans, i)
        }
    }
    return ans
}
