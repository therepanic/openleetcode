func interchangeableRectangles(rectangles [][]int) int64 {
    gcd := func(a, b int) int {
        for b != 0 {
            a, b = b, a%b
        }
        return a
    }
    
    ratioCount := make(map[[2]int]int64)
    var result int64 = 0
    
    for _, rect := range rectangles {
        width, height := rect[0], rect[1]
        g := gcd(width, height)
        reduced := [2]int{width / g, height / g}
        result += ratioCount[reduced]
        ratioCount[reduced]++
    }
    
    return result
}
