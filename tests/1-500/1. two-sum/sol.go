func twoSum(nums []int, target int) []int {
	seen := make(map[int]int)
	for i, num := range nums {
		need := target - num
		if j, ok := seen[need]; ok {
			return []int{j, i}
		}
		seen[num] = i
	}
	return []int{}
}
