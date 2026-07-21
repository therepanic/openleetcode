func constrainedSubsetSum(nums []int, k int) int {
    type pair struct {
        idx int
        val int
    }
    q := []pair{}
    res := -1 << 31
    for i, num := range nums {
        total := num
        if len(q) > 0 {
            total += q[0].val
        }
        if total > res {
            res = total
        }
        for len(q) > 0 && total >= q[len(q)-1].val {
            q = q[:len(q)-1]
        }
        if total > 0 {
            q = append(q, pair{i, total})
        }
        if len(q) > 0 && q[0].idx == i - k {
            q = q[1:]
        }
    }
    return res
}
