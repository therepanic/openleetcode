func findMaximizedCapital(k int, w int, profits []int, capital []int) int {
    n := len(profits)
    type Project struct {
        capital int
        profit  int
    }
    projects := make([]Project, n)
    for i := 0; i < n; i++ {
        projects[i] = Project{capital[i], profits[i]}
    }
    sort.Slice(projects, func(i, j int) bool {
        return projects[i].capital < projects[j].capital
    })
    maxHeap := &IntHeap{}
    heap.Init(maxHeap)
    i := 0
    for j := 0; j < k; j++ {
        for i < n && projects[i].capital <= w {
            heap.Push(maxHeap, projects[i].profit)
            i++
        }
        if maxHeap.Len() == 0 {
            break
        }
        w += heap.Pop(maxHeap).(int)
    }
    return w
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
