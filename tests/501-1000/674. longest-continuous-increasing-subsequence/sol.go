func findLengthOfLCIS(nums []int) int {
    ptr1, ptr2 := 0, 1
    n := len(nums)
    if n == 0 {
        return 0
    }
    maxLenSubseq := 1
    for ptr2 < n {
        for ptr2 < n && nums[ptr2] > nums[ptr2-1] {
            ptr2++
        }
        if ptr2 - ptr1 > maxLenSubseq {
            maxLenSubseq = ptr2 - ptr1
        }
        ptr1 = ptr2
        ptr2++
    }
    return maxLenSubseq
}
