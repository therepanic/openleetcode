func minInterval(intervals [][]int, queries []int) []int {
    sort.Slice(intervals, func(i, j int) bool {
        return intervals[i][0] < intervals[j][0]
    })
    type heapItem struct {
        size int
        r    int
    }
    minHeap := []heapItem{}
    res := map[int]int{}
    i := 0
    sortedQueries := make([]int, len(queries))
    copy(sortedQueries, queries)
    sort.Ints(sortedQueries)
    for _, q := range sortedQueries {
        for i < len(intervals) && intervals[i][0] <= q {
            l, r := intervals[i][0], intervals[i][1]
            minHeap = append(minHeap, heapItem{r - l + 1, r})
            i++
        }
        sort.Slice(minHeap, func(a, b int) bool {
            return minHeap[a].size < minHeap[b].size
        })
        for len(minHeap) > 0 && minHeap[0].r < q {
            minHeap = minHeap[1:]
        }
        if len(minHeap) == 0 {
            res[q] = -1
        } else {
            res[q] = minHeap[0].size
        }
    }
    ans := make([]int, len(queries))
    for j, q := range queries {
        ans[j] = res[q]
    }
    return ans
}
