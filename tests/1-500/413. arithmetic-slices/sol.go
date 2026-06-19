func numberOfArithmeticSlices(nums []int) int {
    c := 0
    t := 2
    for i := 1; i < len(nums)-1; i++ {
        if nums[i-1]-nums[i] == nums[i]-nums[i+1] {
            t++
        } else {
            t = 2
        }
        c += t - 2
    }
    return c
}
