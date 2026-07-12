func mincostToHireWorkers(quality []int, wage []int, k int) float64 {
    n := len(quality)
    type worker struct {
        ratio float64
        quality int
    }
    workers := make([]worker, n)
    for i := 0; i < n; i++ {
        workers[i] = worker{ratio: float64(wage[i]) / float64(quality[i]), quality: quality[i]}
    }
    
    sort.Slice(workers, func(i, j int) bool {
        return workers[i].ratio < workers[j].ratio
    })
    
    minCost := math.MaxFloat64
    var currentQualitySum int64 = 0
    
    h := &IntHeap{}
    
    for _, w := range workers {
        currentQualitySum += int64(w.quality)
        heap.Push(h, w.quality)
        
        if h.Len() > k {
            currentQualitySum -= int64(heap.Pop(h).(int))
        }
        
        if h.Len() == k {
            cost := w.ratio * float64(currentQualitySum)
            if cost < minCost {
                minCost = cost
            }
        }
    }
    
    return minCost
}

type IntHeap []int

func (h IntHeap) Len() int           { return len(h) }
func (h IntHeap) Less(i, j int) bool { return h[i] > h[j] }
func (h IntHeap) Swap(i, j int)      { h[i], h[j] = h[j], h[i] }

func (h *IntHeap) Push(x any) {
    *h = append(*h, x.(int))
}

func (h *IntHeap) Pop() any {
    old := *h
    n := len(old)
    x := old[n-1]
    *h = old[0 : n-1]
    return x
}
