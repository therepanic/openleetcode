type AvailableItem struct {
    weight int
    idx    int
}

type AvailableHeap []AvailableItem

func (h AvailableHeap) Len() int { return len(h) }
func (h AvailableHeap) Less(i, j int) bool {
    if h[i].weight != h[j].weight {
        return h[i].weight < h[j].weight
    }
    return h[i].idx < h[j].idx
}
func (h AvailableHeap) Swap(i, j int) { h[i], h[j] = h[j], h[i] }
func (h *AvailableHeap) Push(x interface{}) { *h = append(*h, x.(AvailableItem)) }
func (h *AvailableHeap) Pop() interface{} {
    old := *h
    n := len(old)
    item := old[n-1]
    *h = old[0 : n-1]
    return item
}

type BusyItem struct {
    freeTime int
    weight   int
    idx      int
}

type BusyHeap []BusyItem

func (h BusyHeap) Len() int { return len(h) }
func (h BusyHeap) Less(i, j int) bool { return h[i].freeTime < h[j].freeTime }
func (h BusyHeap) Swap(i, j int) { h[i], h[j] = h[j], h[i] }
func (h *BusyHeap) Push(x interface{}) { *h = append(*h, x.(BusyItem)) }
func (h *BusyHeap) Pop() interface{} {
    old := *h
    n := len(old)
    item := old[n-1]
    *h = old[0 : n-1]
    return item
}

func assignTasks(servers []int, tasks []int) []int {
    n := len(servers)
    m := len(tasks)
    
    available := &AvailableHeap{}
    heap.Init(available)
    for i := 0; i < n; i++ {
        heap.Push(available, AvailableItem{weight: servers[i], idx: i})
    }
    
    busy := &BusyHeap{}
    heap.Init(busy)
    ans := make([]int, m)
    time := 0
    
    for i := 0; i < m; i++ {
        if time < i {
            time = i
        }
        for busy.Len() > 0 && (*busy)[0].freeTime <= time {
            item := heap.Pop(busy).(BusyItem)
            heap.Push(available, AvailableItem{weight: item.weight, idx: item.idx})
        }
        
        if available.Len() == 0 {
            time = (*busy)[0].freeTime
            for busy.Len() > 0 && (*busy)[0].freeTime <= time {
                item := heap.Pop(busy).(BusyItem)
                heap.Push(available, AvailableItem{weight: item.weight, idx: item.idx})
            }
        }
        
        server := heap.Pop(available).(AvailableItem)
        heap.Push(busy, BusyItem{freeTime: time + tasks[i], weight: server.weight, idx: server.idx})
        ans[i] = server.idx
    }
    
    return ans
}
