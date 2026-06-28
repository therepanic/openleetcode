func dailyTemperatures(temperatures []int) []int {
    n := len(temperatures)
    ans := make([]int, n)
    stack := make([]int, 0, n)

    for i := 0; i < n; i++ {
        for len(stack) > 0 && temperatures[i] > temperatures[stack[len(stack)-1]] {
            prev := stack[len(stack)-1]
            stack = stack[:len(stack)-1]
            ans[prev] = i - prev
        }
        stack = append(stack, i)
    }

    return ans
}
