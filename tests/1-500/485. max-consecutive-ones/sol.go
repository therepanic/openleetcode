func findMaxConsecutiveOnes(nums []int) int {
    res := 0
    left := 0
    for right := 0; right < len(nums); right++ {
        if nums[right] == 0 {
            left = right + 1
        } else {
            if right-left+1 > res {
                res = right - left + 1
            }
        }
    }
    return res
}
