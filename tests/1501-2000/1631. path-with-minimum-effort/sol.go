type item struct { effort, r, c int }

func minimumEffortPath(heights [][]int) int {
    if len(heights) == 0 {
        return 0
    }
    rows, cols := len(heights), len(heights[0])
    pq := &itemHeap{}
    heap.Init(pq)
    heap.Push(pq, item{0, 0, 0})
    maxEffort := 0
    visited := make([][]bool, rows)
    for i := range visited {
        visited[i] = make([]bool, cols)
    }
    dirs := [][]int{{1, 0}, {-1, 0}, {0, 1}, {0, -1}}
    for pq.Len() > 0 {
        curr := heap.Pop(pq).(item)
        effort, r, c := curr.effort, curr.r, curr.c
        if effort > maxEffort {
            maxEffort = effort
        }
        if r == rows-1 && c == cols-1 {
            return maxEffort
        }
        if visited[r][c] {
            continue
        }
        visited[r][c] = true
        for _, d := range dirs {
            nr, nc := r+d[0], c+d[1]
            if nr >= 0 && nr < rows && nc >= 0 && nc < cols && !visited[nr][nc] {
                newEffort := abs(heights[nr][nc] - heights[r][c])
                heap.Push(pq, item{newEffort, nr, nc})
            }
        }
    }
    return maxEffort
}

type itemHeap []item

func (h itemHeap) Len() int           { return len(h) }
func (h itemHeap) Less(i, j int) bool { return h[i].effort < h[j].effort }
func (h itemHeap) Swap(i, j int)      { h[i], h[j] = h[j], h[i] }
func (h *itemHeap) Push(x interface{}) { *h = append(*h, x.(item)) }
func (h *itemHeap) Pop() interface{} {
    old := *h
    n := len(old)
    x := old[n-1]
    *h = old[0 : n-1]
    return x
}

func abs(x int) int {
    if x < 0 {
        return -x
    }
    return x
}
