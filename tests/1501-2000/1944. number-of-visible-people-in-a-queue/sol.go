func canSeePersonsCount(heights []int) []int {
    n := len(heights)
    result := make([]int, n)
    stack := []int{}

    for i := n-1; i >= 0; i-- {
        height := heights[i]
        visibility := 0

        for len(stack) > 0 && height > stack[len(stack)-1] {
            stack = stack[:len(stack)-1]
            visibility++
        }

        if len(stack) > 0 {
            visibility++
        }

        result[i] = visibility
        stack = append(stack, height)
    }

    return result
}
