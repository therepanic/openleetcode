func check(nums []int) bool {
    n := len(nums)
    count := 0
    for i := 0; i < n; i++ {
        if nums[i] > nums[(i+1)%n] {
            count++
        }
    }
    return count <= 1
}
