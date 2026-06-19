func findSubsequences(nums []int) [][]int {
    result := make(map[string][]int)
    var backtrack func(int, []int)
    backtrack = func(index int, path []int) {
        if len(path) >= 2 {
            key := fmt.Sprint(path)
            if _, exists := result[key]; !exists {
                result[key] = append([]int{}, path...)
            }
        }
        used := make(map[int]bool)
        for i := index; i < len(nums); i++ {
            if used[nums[i]] {
                continue
            }
            if len(path) == 0 || nums[i] >= path[len(path)-1] {
                used[nums[i]] = true
                path = append(path, nums[i])
                backtrack(i+1, path)
                path = path[:len(path)-1]
            }
        }
    }
    backtrack(0, []int{})
    res := make([][]int, 0, len(result))
    for _, v := range result {
        res = append(res, v)
    }
    return res
}
