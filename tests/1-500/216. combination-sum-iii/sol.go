func combinationSum3(k int, n int) [][]int {
    res := [][]int{}
    var backtrack func(int, []int, int, int)
    backtrack = func(start int, path []int, target int, k int) {
        if target == 0 && k == 0 {
            tmp := make([]int, len(path))
            copy(tmp, path)
            res = append(res, tmp)
            return
        }
        for i := start; i <= 9; i++ {
            if i > target || k <= 0 {
                break
            }
            path = append(path, i)
            backtrack(i+1, path, target-i, k-1)
            path = path[:len(path)-1]
        }
    }
    backtrack(1, []int{}, n, k)
    return res
}
