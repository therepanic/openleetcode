func maxWidthOfVerticalArea(points [][]int) int {
    maxWidth := 0
    sort.Slice(points, func(i, j int) bool {
        return points[i][0] < points[j][0]
    })
    for i := 0; i < len(points)-1; i++ {
        width := points[i+1][0] - points[i][0]
        if width > maxWidth {
            maxWidth = width
        }
    }
    return maxWidth
}
