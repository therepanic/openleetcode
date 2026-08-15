type Item struct {
    gain float64
    p, t int
}

type MaxHeap []Item

func (h MaxHeap) Len() int           { return len(h) }
func (h MaxHeap) Less(i, j int) bool { return h[i].gain > h[j].gain }
func (h MaxHeap) Swap(i, j int)      { h[i], h[j] = h[j], h[i] }
func (h *MaxHeap) Push(x interface{}) { *h = append(*h, x.(Item)) }
func (h *MaxHeap) Pop() interface{} {
    old := *h
    n := len(old)
    item := old[n-1]
    *h = old[:n-1]
    return item
}

func maxAverageRatio(classes [][]int, extraStudents int) float64 {
    pq := make([]Item, 0, len(classes))
    for _, c := range classes {
        p, t := c[0], c[1]
        gain := float64(p+1)/float64(t+1) - float64(p)/float64(t)
        pq = append(pq, Item{gain, p, t})
    }
    for i := 0; i < extraStudents; i++ {
        best := 0
        for j := 1; j < len(pq); j++ { if pq[j].gain > pq[best].gain { best = j } }
        top := pq[best]
        p, t := top.p+1, top.t+1
        gain := float64(p+1)/float64(t+1) - float64(p)/float64(t)
        pq[best] = Item{gain, p, t}
    }
    sum := 0.0
    for _, item := range pq {
        sum += float64(item.p) / float64(item.t)
    }
    return sum / float64(len(classes))
}
