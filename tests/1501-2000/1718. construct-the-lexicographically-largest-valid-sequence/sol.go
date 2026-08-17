func constructDistancedSequence(n int) []int {
    result := make([]int, 2*n-1)
    used := make([]bool, n+1)
    backtrack(result, used, n, 0)
    return result
}

func backtrack(result []int, used []bool, n int, index int) bool {
    idx := index
    for idx < len(result) && result[idx] != 0 {
        idx++
    }
    if idx == len(result) {
        return true
    }

    for i := n; i >= 1; i-- {
        if used[i] {
            continue
        }

        if i == 1 {
            result[idx] = 1
            used[1] = true
            if backtrack(result, used, n, idx+1) {
                return true
            }
            result[idx] = 0
            used[1] = false
        } else if idx+i < len(result) && result[idx+i] == 0 {
            result[idx] = i
            result[idx+i] = i
            used[i] = true
            if backtrack(result, used, n, idx+1) {
                return true
            }
            result[idx] = 0
            result[idx+i] = 0
            used[i] = false
        }
    }

    return false
}
