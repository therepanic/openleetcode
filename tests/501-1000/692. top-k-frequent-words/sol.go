func topKFrequent(words []string, k int) []string {
    counter := map[string]int{}
    for _, w := range words {
        counter[w]++
    }
    type pair struct {
        f int
        w string
    }
    heap := make([]pair, 0, len(counter))
    for w, f := range counter {
        heap = append(heap, pair{-f, w})
    }
    sort.Slice(heap, func(i, j int) bool {
        if heap[i].f != heap[j].f {
            return heap[i].f < heap[j].f
        }
        return heap[i].w < heap[j].w
    })
    ans := make([]string, k)
    for i := 0; i < k; i++ {
        ans[i] = heap[i].w
    }
    return ans
}
