func validSquare(p1 []int, p2 []int, p3 []int, p4 []int) bool {
    getDistSq := func(pt1, pt2 []int) int {
        return (pt1[0]-pt2[0])*(pt1[0]-pt2[0]) + 
               (pt1[1]-pt2[1])*(pt1[1]-pt2[1])
    }
    
    points := [][]int{p1, p2, p3, p4}
    distances := make(map[int]bool)
    
    for i := 0; i < 4; i++ {
        for j := i + 1; j < 4; j++ {
            distances[getDistSq(points[i], points[j])] = true
        }
    }
    
    _, hasZero := distances[0]
    return len(distances) == 2 && !hasZero
}
