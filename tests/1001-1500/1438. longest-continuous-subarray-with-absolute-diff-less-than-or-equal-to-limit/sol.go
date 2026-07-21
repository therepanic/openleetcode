func longestSubarray(nums []int, limit int) int {
    maxq := make([]int, 0)
    minq := make([]int, 0)
    left := 0
    max_len := 1
    for right := 0; right < len(nums); right++ {
        for len(maxq) > 0 && nums[maxq[len(maxq)-1]] <= nums[right] {
            maxq = maxq[:len(maxq)-1]
        }
        maxq = append(maxq, right)
        for len(minq) > 0 && nums[minq[len(minq)-1]] >= nums[right] {
            minq = minq[:len(minq)-1]
        }
        minq = append(minq, right)
        for nums[maxq[0]]-nums[minq[0]] > limit {
            left++
            if maxq[0] < left {
                maxq = maxq[1:]
            }
            if minq[0] < left {
                minq = minq[1:]
            }
        }
        if right-left+1 > max_len {
            max_len = right - left + 1
        }
    }
    return max_len
}
