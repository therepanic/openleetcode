func threeSumClosest(nums []int, target int) int {
	sort.Ints(nums)
	best := nums[0] + nums[1] + nums[2]
	for i := 0; i+2 < len(nums); i++ {
		l, r := i+1, len(nums)-1
		for l < r {
			sum := nums[i] + nums[l] + nums[r]
			if absInt(target-sum) < absInt(target-best) {
				best = sum
			}
			if sum == target {
				return target
			} else if sum < target {
				l++
			} else {
				r--
			}
		}
	}
	return best
}
