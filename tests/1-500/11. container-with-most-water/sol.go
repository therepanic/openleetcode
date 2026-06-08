func maxArea(height []int) int {
	left, right := 0, len(height)-1
	ans := 0
	for left < right {
		area := min(height[left], height[right]) * (right - left)
		if area > ans {
			ans = area
		}
		if height[left] < height[right] {
			left++
		} else {
			right--
		}
	}
	return ans
}
