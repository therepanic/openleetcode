type IntHeap []int

func (h IntHeap) Len() int            { return len(h) }
func (h IntHeap) Less(i, j int) bool  { return h[i] > h[j] }
func (h IntHeap) Swap(i, j int)       { h[i], h[j] = h[j], h[i] }
func (h *IntHeap) Push(x interface{}) { *h = append(*h, x.(int)) }
func (h *IntHeap) Pop() interface{} {
    old := *h
    n := len(old)
    x := old[n-1]
    *h = old[:n-1]
    return x
}

func isPossible(target []int) bool {
    h := &IntHeap{}
    heap.Init(h)
    total := 0
    for _, v := range target {
        heap.Push(h, v)
        total += v
    }
    for {
        largest := heap.Pop(h).(int)
        rest := total - largest
        if largest == 1 || rest == 1 {
            return true
        }
        if rest == 0 || rest >= largest {
            return false
        }
        previous := largest % rest
        if previous == 0 {
            return false
        }
        total = rest + previous
        heap.Push(h, previous)
    }
}
