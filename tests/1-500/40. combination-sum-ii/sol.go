import "sort"

func combinationSum2(candidates []int, target int) [][]int {
    sort.Ints(candidates)
    res := [][]int{}
    cur := []int{}

    var dfs func(int, int)
    dfs = func(start int, total int) {
        if total == target {
            res = append(res, append([]int(nil), cur...))
            return
        }

        for i := start; i < len(candidates); i++ {
            if i > start && candidates[i] == candidates[i-1] {
                continue
            }
            if total+candidates[i] > target {
                break
            }
            cur = append(cur, candidates[i])
            dfs(i+1, total+candidates[i])
            cur = cur[:len(cur)-1]
        }
    }

    dfs(0, 0)
    return res
}
