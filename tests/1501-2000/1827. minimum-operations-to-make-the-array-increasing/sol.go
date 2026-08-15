func minOperations(nums []int) int {
    c := nums[0]
    s := 0
    for i := 1; i < len(nums); i++ {
        if nums[i] > c {
            c = nums[i]
        } else {
            c++
            s += c - nums[i]
        }
    }
    return s
}
