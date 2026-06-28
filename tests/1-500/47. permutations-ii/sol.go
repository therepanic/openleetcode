func permuteUnique(nums []int) [][]int {
    sort.Ints(nums)
    used := make([]bool, len(nums))
    res := [][]int{}
    cur := []int{}

    var dfs func()
    dfs = func() {
        if len(cur) == len(nums) {
            res = append(res, append([]int(nil), cur...))
            return
        }

        for i := 0; i < len(nums); i++ {
            if used[i] {
                continue
            }
            if i > 0 && nums[i] == nums[i-1] && !used[i-1] {
                continue
            }
            used[i] = true
            cur = append(cur, nums[i])
            dfs()
            cur = cur[:len(cur)-1]
            used[i] = false
        }
    }

    dfs()
    return res
}
