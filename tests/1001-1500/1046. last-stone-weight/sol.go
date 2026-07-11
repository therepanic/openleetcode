func lastStoneWeight(stones []int) int {
    h := &IntHeap{}
    heap.Init(h)
    
    for _, stone := range stones {
        heap.Push(h, stone)
    }
    
    for h.Len() > 1 {
        maxStone1 := heap.Pop(h).(int)
        maxStone2 := heap.Pop(h).(int)
        
        if maxStone1 != maxStone2 {
            heap.Push(h, maxStone1-maxStone2)
        }
    }
    
    if h.Len() == 0 {
        return 0
    }
    return heap.Pop(h).(int)
}

type IntHeap []int

func (h IntHeap) Len() int           { return len(h) }
func (h IntHeap) Less(i, j int) bool { return h[i] > h[j] }
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
