func maximalRectangle(matrix [][]byte) int {
	if len(matrix) == 0 || len(matrix[0]) == 0 {
		return 0
	}
	cols := len(matrix[0])
	heights := make([]int, cols)
	ans := 0
	for _, row := range matrix {
		for c := 0; c < cols; c++ {
			if row[c] == '1' {
				heights[c]++
			} else {
				heights[c] = 0
			}
		}
		area := largestHistogram(heights)
		if area > ans {
			ans = area
		}
	}
	return ans
}

func largestHistogram(heights []int) int {
	stack := []int{}
	best := 0
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
			if area > best {
				best = area
			}
		}
		stack = append(stack, i)
	}
	return best
}
