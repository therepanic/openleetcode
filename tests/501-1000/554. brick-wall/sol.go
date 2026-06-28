func leastBricks(wall [][]int) int {
    edgeCounts := make(map[int]int)
    for _, row := range wall {
        edge := 0
        for _, brick := range row[:len(row)-1] {
            edge += brick
            edgeCounts[edge]++
        }
    }
    maxEdges := 0
    for _, count := range edgeCounts {
        if count > maxEdges {
            maxEdges = count
        }
    }
    return len(wall) - maxEdges
}
