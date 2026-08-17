func maxOperations(nums []int, k int) int {
    sort.Ints(nums)
    i, j := 0, len(nums)-1
    count := 0

    for i < j {
        total := nums[i] + nums[j]
        if total == k {
            count++
            i++
            j--
        } else if total > k {
            j--
        } else {
            i++
        }
    }

    return count
}
