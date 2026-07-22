func maxPerformance(n int, speed []int, efficiency []int, k int) int {
    const MOD = 1000000007
    type Engineer struct {
        efficiency int
        speed      int
    }
    engineers := make([]Engineer, n)
    for i := 0; i < n; i++ {
        engineers[i] = Engineer{efficiency[i], speed[i]}
    }
    sort.Slice(engineers, func(i, j int) bool {
        return engineers[i].efficiency > engineers[j].efficiency
    })
    
    h := &IntHeap{}
    heap.Init(h)
    var curSum int64 = 0
    var ans int64 = 0
    
    for _, eng := range engineers {
        for h.Len() > k-1 {
            curSum -= int64(heap.Pop(h).(int))
        }
        heap.Push(h, eng.speed)
        curSum += int64(eng.speed)
        if curSum*int64(eng.efficiency) > ans {
            ans = curSum * int64(eng.efficiency)
        }
    }
    
    return int(ans % MOD)
}

type IntHeap []int

func (h IntHeap) Len() int           { return len(h) }
func (h IntHeap) Less(i, j int) bool { return h[i] < h[j] }
func (h IntHeap) Swap(i, j int)      { h[i], h[j] = h[j], h[i] }

func (h *IntHeap) Push(x interface{}) {
    *h = append(*h, x.(int))
}

func (h *IntHeap) Pop() interface{} {
    old := *h
    n := len(old)
    x := old[n-1]
    *h = old[0 : n-1]
    return x
}
