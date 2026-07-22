func minTimeToVisitAllPoints(points [][]int) int {
    ans := 0
    for i := 1; i < len(points); i++ {
        dx := points[i][0] - points[i-1][0]
        if dx < 0 {
            dx = -dx
        }
        dy := points[i][1] - points[i-1][1]
        if dy < 0 {
            dy = -dy
        }
        if dx > dy {
            ans += dx
        } else {
            ans += dy
        }
    }
    return ans
}
