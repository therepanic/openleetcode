func specialArray(nums []int) int {
    ans := make([]int, len(nums)+1)
    for i := 0; i <= len(nums); i++ {
        count := 0
        for _, ele := range nums {
            if i <= ele {
                count++
            }
        }
        ans[i] = count
        if ans[i] == i {
            return i
        }
    }
    return -1
}
