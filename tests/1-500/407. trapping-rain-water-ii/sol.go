type Cell struct {
	height, x, y int
}

type MinHeap []Cell

func (h MinHeap) Len() int           { return len(h) }
func (h MinHeap) Less(i, j int) bool { return h[i].height < h[j].height }
func (h MinHeap) Swap(i, j int)      { h[i], h[j] = h[j], h[i] }

func (h *MinHeap) Push(x interface{}) {
	*h = append(*h, x.(Cell))
}

func (h *MinHeap) Pop() interface{} {
	old := *h
	n := len(old)
	item := old[n-1]
	*h = old[0 : n-1]
	return item
}

func trapRainWater(heightMap [][]int) int {
	if len(heightMap) < 3 || len(heightMap[0]) < 3 {
		return 0
	}

	m, n := len(heightMap), len(heightMap[0])
	visited := make([][]bool, m)
	for i := range visited {
		visited[i] = make([]bool, n)
	}

	h := &MinHeap{}
	heap.Init(h)

	for i := 0; i < m; i++ {
		heap.Push(h, Cell{heightMap[i][0], i, 0})
		heap.Push(h, Cell{heightMap[i][n-1], i, n - 1})
		visited[i][0] = true
		visited[i][n-1] = true
	}
	for j := 0; j < n; j++ {
		heap.Push(h, Cell{heightMap[0][j], 0, j})
		heap.Push(h, Cell{heightMap[m-1][j], m - 1, j})
		visited[0][j] = true
		visited[m-1][j] = true
	}

	result := 0
	directions := [][]int{{0, 1}, {1, 0}, {0, -1}, {-1, 0}}

	for h.Len() > 0 {
		cell := heap.Pop(h).(Cell)
		height, x, y := cell.height, cell.x, cell.y

		for _, d := range directions {
			nx, ny := x+d[0], y+d[1]
			if nx >= 0 && nx < m && ny >= 0 && ny < n && !visited[nx][ny] {
				if height > heightMap[nx][ny] {
					result += height - heightMap[nx][ny]
				}
				newHeight := height
				if heightMap[nx][ny] > newHeight {
					newHeight = heightMap[nx][ny]
				}
				heap.Push(h, Cell{newHeight, nx, ny})
				visited[nx][ny] = true
			}
		}
	}

	return result
}
