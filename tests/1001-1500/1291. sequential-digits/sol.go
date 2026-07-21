func sequentialDigits(low int, high int) []int {
    q := make([]int, 0)
    for i := 1; i <= 9; i++ {
        q = append(q, i)
    }
    for i := 0; i < len(q); i++ {
        x := q[i]
        d := x % 10
        if d < 9 {
            q = append(q, x*10+d+1)
        }
    }
    result := make([]int, 0)
    for _, x := range q {
        if low <= x && x <= high {
            result = append(result, x)
        }
    }
    return result
}
