func minInteger(num string, k int) string {
    n := len(num)
    dict := make(map[byte][]int)
    for i := 0; i < n; i++ {
        ch := num[i]
        dict[ch] = append(dict[ch], i)
    }
    
    bit := make([]int, n+1)
    update := func(i, val int) {
        for i < len(bit) {
            bit[i] += val
            i += i & -i
        }
    }
    query := func(i int) int {
        total := 0
        for i > 0 {
            total += bit[i]
            i -= i & -i
        }
        return total
    }
    
    for i := 1; i <= n; i++ {
        update(i, 1)
    }
    
    res := make([]byte, 0, n)
    for pos := 0; pos < n; pos++ {
        for v := byte('0'); v <= byte('9'); v++ {
            if len(dict[v]) > 0 {
                idx := dict[v][0]
                cnt := query(idx)
                if cnt <= k {
                    dict[v] = dict[v][1:]
                    k -= cnt
                    res = append(res, v)
                    update(idx+1, -1)
                    break
                }
            }
        }
    }
    return string(res)
}
