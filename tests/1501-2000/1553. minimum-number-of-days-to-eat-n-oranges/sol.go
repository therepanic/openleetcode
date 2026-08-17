func minDays(n int) int {
    ans := 0
    queue := []int{n}
    seen := make(map[int]bool)
    for len(queue) > 0 {
        var newq []int
        for _, x := range queue {
            if x == 0 {
                return ans
            }
            seen[x] = true
            if !seen[x-1] {
                newq = append(newq, x-1)
            }
            if x%2 == 0 && !seen[x/2] {
                newq = append(newq, x/2)
            }
            if x%3 == 0 && !seen[x/3] {
                newq = append(newq, x/3)
            }
        }
        ans++
        queue = newq
    }
    return ans
}
