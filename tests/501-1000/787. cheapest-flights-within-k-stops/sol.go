func findCheapestPrice(n int, flights [][]int, src int, dst int, k int) int {
    matrix := make([][][2]int, n)
    for _, flight := range flights {
        u, v, w := flight[0], flight[1], flight[2]
        matrix[u] = append(matrix[u], [2]int{v, w})
    }

    distance := make([]int, n)
    for i := range distance {
        distance[i] = 1<<31 - 1 // MaxInt32
    }
    distance[src] = 0

    queue := [][2]int{{src, 0}}
    steps := 0

    for len(queue) > 0 {
        level := len(queue)
        if steps == k+1 {
            break
        }
        steps++

        for i := 0; i < level; i++ {
            node, dist := queue[0][0], queue[0][1]
            queue = queue[1:]

            for _, neighbor := range matrix[node] {
                v, w := neighbor[0], neighbor[1]
                if w+dist < distance[v] {
                    distance[v] = w + dist
                    queue = append(queue, [2]int{v, dist + w})
                }
            }
        }
    }

    if distance[dst] == 1<<31-1 {
        return -1
    }
    return distance[dst]
}
