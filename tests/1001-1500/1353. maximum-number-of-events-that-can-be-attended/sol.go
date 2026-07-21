func maxEvents(events [][]int) int {
    sort.Slice(events, func(i, j int) bool {
        return events[i][0] < events[j][0]
    })
    minHeap := &IntHeap{}
    heap.Init(minHeap)
    day := 0
    i := 0
    n := len(events)
    result := 0
    
    for minHeap.Len() > 0 || i < n {
        if minHeap.Len() == 0 {
            day = events[i][0]
        }
        for i < n && events[i][0] <= day {
            heap.Push(minHeap, events[i][1])
            i++
        }
        heap.Pop(minHeap)
        result++
        day++
        for minHeap.Len() > 0 && (*minHeap)[0] < day {
            heap.Pop(minHeap)
        }
    }
    return result
}

type IntHeap []int
func (h IntHeap) Len() int           { return len(h) }
func (h IntHeap) Less(i, j int) bool { return h[i] < h[j] }
func (h IntHeap) Swap(i, j int)      { h[i], h[j] = h[j], h[i] }
func (h *IntHeap) Push(x interface{}) { *h = append(*h, x.(int)) }
func (h *IntHeap) Pop() interface{} {
    old := *h
    n := len(old)
    x := old[n-1]
    *h = old[:n-1]
    return x
}
