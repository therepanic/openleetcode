func maximumGap(nums []int) int {
    if len(nums) < 2 {
        return 0
    }
    nums = mergeSort164(append([]int(nil), nums...))
    best := 0
    for i := 1; i < len(nums); i++ {
        if nums[i]-nums[i-1] > best {
            best = nums[i] - nums[i-1]
        }
    }
    return best
}

func mergeSort164(nums []int) []int {
    if len(nums) <= 1 {
        return nums
    }
    mid := len(nums) / 2
    left := mergeSort164(nums[:mid])
    right := mergeSort164(nums[mid:])
    merged := make([]int, 0, len(nums))
    i, j := 0, 0
    for i < len(left) && j < len(right) {
        if left[i] <= right[j] {
            merged = append(merged, left[i])
            i++
        } else {
            merged = append(merged, right[j])
            j++
        }
    }
    merged = append(merged, left[i:]...)
    merged = append(merged, right[j:]...)
    return merged
}
