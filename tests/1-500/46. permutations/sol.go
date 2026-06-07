func permute(nums []int) [][]int {
    res := [][]int{}

    var dfs func(int)
    dfs = func(i int) {
        if i == len(nums) {
            res = append(res, append([]int(nil), nums...))
            return
        }

        for j := i; j < len(nums); j++ {
            nums[i], nums[j] = nums[j], nums[i]
            dfs(i + 1)
            nums[i], nums[j] = nums[j], nums[i]
        }
    }

    dfs(0)
    return res
}
