func rearrangeBarcodes(barcodes []int) []int {
    counts := make(map[int]int)
    for _, v := range barcodes {
        counts[v]++
    }

    type item struct {
        val int
        cnt int
    }
    items := make([]item, 0, len(counts))
    for v, c := range counts {
        items = append(items, item{val: v, cnt: c})
    }
    for i := 0; i < len(items); i++ {
        best := i
        for j := i + 1; j < len(items); j++ {
            if items[j].cnt > items[best].cnt || (items[j].cnt == items[best].cnt && items[j].val < items[best].val) {
                best = j
            }
        }
        items[i], items[best] = items[best], items[i]
    }

    res := make([]int, len(barcodes))
    idx := 0
    for _, it := range items {
        for c := 0; c < it.cnt; c++ {
            if idx >= len(res) {
                idx = 1
            }
            res[idx] = it.val
            idx += 2
        }
    }
    return res
}
