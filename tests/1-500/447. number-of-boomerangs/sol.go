func numberOfBoomerangs(points [][]int) int {
    result := 0
    for _, p := range points {
        distances := make(map[int]int)
        for _, q := range points {
            d := (p[0]-q[0])*(p[0]-q[0]) + (p[1]-q[1])*(p[1]-q[1])
            distances[d]++
        }
        for _, count := range distances {
            result += count * (count - 1)
        }
    }
    return result
}
