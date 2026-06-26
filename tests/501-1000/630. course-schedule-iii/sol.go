import (
	"container/heap"
	"sort"
)

func scheduleCourse(courses [][]int) int {
    sort.Slice(courses, func(i, j int) bool {
        if courses[i][1] == courses[j][1] {
            return courses[i][0] < courses[j][0]
        }
        return courses[i][1] < courses[j][1]
    })
    h := &IntHeap{}
    heap.Init(h)
    days := 0
    for _, course := range courses {
        duration := course[0]
        last := course[1]
        days += duration
        heap.Push(h, duration)
        if days > last {
            top := heap.Pop(h).(int)
            days -= top
        }
    }
    return h.Len()
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
