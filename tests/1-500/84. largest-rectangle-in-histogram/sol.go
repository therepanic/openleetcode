func largestRectangleArea(heights []int) int {
	stack := []int{}
	ans := 0
	for i := 0; i <= len(heights); i++ {
		cur := 0
		if i < len(heights) {
			cur = heights[i]
		}
		for len(stack) > 0 && heights[stack[len(stack)-1]] > cur {
			h := heights[stack[len(stack)-1]]
			stack = stack[:len(stack)-1]
			left := -1
			if len(stack) > 0 {
				left = stack[len(stack)-1]
			}
			area := h * (i - left - 1)
			if area > ans {
				ans = area
			}
		}
		stack = append(stack, i)
	}
	return ans
}
