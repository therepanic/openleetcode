func getOrder(tasks [][]int) []int {
    n := len(tasks)
    indexed := make([][3]int, n)
    for i := 0; i < n; i++ {
        indexed[i] = [3]int{tasks[i][0], tasks[i][1], i}
    }
    sort.Slice(indexed, func(a, b int) bool {
        if indexed[a][0] != indexed[b][0] { return indexed[a][0] < indexed[b][0] }
        if indexed[a][1] != indexed[b][1] { return indexed[a][1] < indexed[b][1] }
        return indexed[a][2] < indexed[b][2]
    })
    
    result := make([]int, 0, n)
    heap := &taskHeap{}
    heap.Init()
    time := int64(0)
    idx := 0
    
    for idx < n || heap.Len() > 0 {
        if heap.Len() == 0 && time < int64(indexed[idx][0]) {
            time = int64(indexed[idx][0])
        }
        
        for idx < n && int64(indexed[idx][0]) <= time {
            heap.Push([2]int{indexed[idx][1], indexed[idx][2]})
            idx++
        }
        
        item := heap.Pop().([2]int)
        result = append(result, item[1])
        time += int64(item[0])
    }
    
    return result
}

type taskHeap [][2]int

func (h taskHeap) Len() int           { return len(h) }
func (h taskHeap) Less(i, j int) bool { 
    if h[i][0] != h[j][0] {
        return h[i][0] < h[j][0]
    }
    return h[i][1] < h[j][1]
}
func (h taskHeap) Swap(i, j int)      { h[i], h[j] = h[j], h[i] }
func (h *taskHeap) Push(x interface{}) { *h = append(*h, x.([2]int)); sort.Sort(h) }
func (h *taskHeap) Pop() interface{} {
	old := *h
	item := old[0]
	*h = old[1:]
	return item
}
func (h *taskHeap) Init() { sort.Sort(h) }
