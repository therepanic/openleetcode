func countPoints(points [][]int, queries [][]int) []int {
    result := make([]int, len(queries))
    for i := 0; i < len(queries); i++ {
        for j := 0; j < len(points); j++ {
            dx := queries[i][0] - points[j][0]
            dy := queries[i][1] - points[j][1]
            if dx*dx + dy*dy <= queries[i][2]*queries[i][2] {
                result[i]++
            }
        }
    }
    return result
}
