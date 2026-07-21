func longestSubarray(nums []int) int {
    left, zeros, res := 0, 0, 0
    for right := 0; right < len(nums); right++ {
        if nums[right] == 0 {
            zeros++
        }
        for zeros > 1 {
            if nums[left] == 0 {
                zeros--
            }
            left++
        }
        if right-left > res {
            res = right - left
        }
    }
    return res
}
