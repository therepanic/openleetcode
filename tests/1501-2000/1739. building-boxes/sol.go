func minimumBoxes(n int) int {
    x := int(math.Cbrt(float64(6*n)))
    for (x+1)*(x+2)*(x+3) <= 6*n { x++ }
    for x*(x+1)*(x+2) > 6*n { x-- }
    
    ans := x*(x+1)/2
    n -= x*(x+1)*(x+2)/6
    k := 1
    for n > 0 {
        ans++
        n -= k
        k++
    }
    return ans
}
