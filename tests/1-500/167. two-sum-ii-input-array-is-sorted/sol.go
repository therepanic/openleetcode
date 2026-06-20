func twoSum(numbers []int, target int) []int {
	left, right := 0, len(numbers)-1
	for left < right {
		total := numbers[left] + numbers[right]
		if total == target {
			return []int{left + 1, right + 1}
		}
		if total < target {
			left++
		} else {
			right--
		}
	}
	return []int{}
}
