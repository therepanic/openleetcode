import containerheap "container/heap"

type Item struct {
    expire int
    count  int
}

type MinHeap []Item

func (h MinHeap) Len() int { return len(h) }
func (h MinHeap) Less(i, j int) bool { return h[i].expire < h[j].expire }
func (h MinHeap) Swap(i, j int) { h[i], h[j] = h[j], h[i] }
func (h *MinHeap) Push(x interface{}) { *h = append(*h, x.(Item)) }
func (h *MinHeap) Pop() interface{} {
    old := *h
    n := len(old)
    item := old[n-1]
    *h = old[:n-1]
    return item
}

func eatenApples(apples []int, days []int) int {
    pq := &MinHeap{}
    containerheap.Init(pq)
    n := len(apples)
    res := 0
    day := 0
    for pq.Len() > 0 || day < n {
        if day < n && apples[day] > 0 {
            containerheap.Push(pq, Item{day + days[day], apples[day]})
        }
        for pq.Len() > 0 && (*pq)[0].expire <= day {
            containerheap.Pop(pq)
        }
        if pq.Len() > 0 {
            item := containerheap.Pop(pq).(Item)
            res++
            if item.count-1 > 0 {
                containerheap.Push(pq, Item{item.expire, item.count - 1})
            }
        }
        day++
    }
    return res
}
