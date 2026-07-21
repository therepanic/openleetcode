func getKth(lo int, hi int, k int) int {
    type pair struct {
        val, steps int
    }
    vc := make([]pair, 0, hi-lo+1)
    for i := lo; i <= hi; i++ {
        num := i
        count := 0
        for num != 1 {
            if num%2 == 0 {
                num /= 2
            } else {
                num = 3*num + 1
            }
            count++
        }
        vc = append(vc, pair{i, count})
    }
    sort.Slice(vc, func(i, j int) bool {
        if vc[i].steps != vc[j].steps {
            return vc[i].steps < vc[j].steps
        }
        return vc[i].val < vc[j].val
    })
    return vc[k-1].val
}
