func checkSubarraySum(nums []int, k int) bool {
    if len(nums) == 0 {
        return false
    }

    prefixSum := 0
    remainderMap := map[int]int{0: -1}

    for i, num := range nums {
        prefixSum += num
        remainder := prefixSum % k

        if idx, ok := remainderMap[remainder]; ok {
            if i-idx > 1 {
                return true
            }
        } else {
            remainderMap[remainder] = i
        }
    }

    return false
}
