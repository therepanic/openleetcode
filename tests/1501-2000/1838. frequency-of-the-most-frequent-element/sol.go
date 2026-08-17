func maxFrequency(nums []int, k int) int {
    sort.Ints(nums)
    left := 0
    right := 0
    res := 0
    total := int64(0)

    for right < len(nums) {
        total += int64(nums[right])

        for int64(nums[right]) * int64(right-left+1) > total + int64(k) {
            total -= int64(nums[left])
            left++
        }
        
        if right-left+1 > res {
            res = right-left+1
        }
        right++
    }
    
    return res
}
