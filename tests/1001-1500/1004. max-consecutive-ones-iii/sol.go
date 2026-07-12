func longestOnes(nums []int, k int) int {
    left, maxLength, zeroCount := 0, 0, 0
    for right := 0; right < len(nums); right++ {
        if nums[right] == 0 {
            zeroCount++
        }
        for zeroCount > k {
            if nums[left] == 0 {
                zeroCount--
            }
            left++
        }
        if right-left+1 > maxLength {
            maxLength = right - left + 1
        }
    }
    return maxLength
}
