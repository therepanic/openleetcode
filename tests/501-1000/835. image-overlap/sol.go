func largestOverlap(img1 [][]int, img2 [][]int) int {
    n := len(img1)
    type point struct{ x, y int }
    var a, b []point
    for i := 0; i < n; i++ {
        for j := 0; j < n; j++ {
            if img1[i][j] == 1 {
                a = append(a, point{i, j})
            }
            if img2[i][j] == 1 {
                b = append(b, point{i, j})
            }
        }
    }
    cnt := make(map[[2]int]int)
    for _, p1 := range a {
        for _, p2 := range b {
            key := [2]int{p1.x - p2.x, p1.y - p2.y}
            cnt[key]++
        }
    }
    max := 0
    for _, v := range cnt {
        if v > max {
            max = v
        }
    }
    return max
}
