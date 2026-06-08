func trap(height []int) int {
    left := 0
    right := len(height) - 1
    leftMax := 0
    rightMax := 0
    total := 0

    for left < right {
        if height[left] > leftMax {
            leftMax = height[left]
        }
        if height[right] > rightMax {
            rightMax = height[right]
        }

        if leftMax < rightMax {
            total += leftMax - height[left]
            left++
        } else {
            total += rightMax - height[right]
            right--
        }
    }

    return total
}
