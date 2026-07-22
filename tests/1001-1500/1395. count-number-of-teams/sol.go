func numTeams(rating []int) int {
    total := 0
    n := len(rating)
    for j := 1; j < n - 1; j++ {
        leftLess := 0
        leftGreater := 0
        for i := 0; i < j; i++ {
            if rating[i] < rating[j] {
                leftLess++
            } else if rating[i] > rating[j] {
                leftGreater++
            }
        }
        
        rightLess := 0
        rightGreater := 0
        for k := j + 1; k < n; k++ {
            if rating[k] < rating[j] {
                rightLess++
            } else if rating[k] > rating[j] {
                rightGreater++
            }
        }
        
        total += leftLess * rightGreater + leftGreater * rightLess
    }
    return total
}
