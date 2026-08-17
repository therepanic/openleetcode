import containerheap "container/heap"

type IntHeap []int

func (h IntHeap) Len() int           { return len(h) }
func (h IntHeap) Less(i, j int) bool { return h[i] < h[j] }
func (h IntHeap) Swap(i, j int)      { h[i], h[j] = h[j], h[i] }
func (h *IntHeap) Push(x interface{}) { *h = append(*h, x.(int)) }
func (h *IntHeap) Pop() interface{} {
    old := *h
    n := len(old)
    x := old[n-1]
    *h = old[0:n-1]
    return x
}

func furthestBuilding(heights []int, bricks int, ladders int) int {
    h := &IntHeap{}
    containerheap.Init(h)
    n := len(heights)
    for i := 1; i < n; i++ {
        climb := heights[i] - heights[i-1]
        if climb <= 0 {
            continue
        }
        containerheap.Push(h, climb)
        if h.Len() > ladders {
            diff := containerheap.Pop(h).(int)
            if bricks >= diff {
                bricks -= diff
            } else {
                return i-1
            }
        }
    }
    return n-1
}
