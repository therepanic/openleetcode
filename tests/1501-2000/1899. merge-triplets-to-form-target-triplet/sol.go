func mergeTriplets(triplets [][]int, target []int) bool {
    for _, t := range triplets {
        if t[0] == target[0] && t[1] == target[1] && t[2] == target[2] {
            return true
        }
    }
    curr := []int{0, 0, 0}
    for _, t := range triplets {
        flag := false
        if target[0] == t[0] && curr[0] != target[0] {
            flag = true
        }
        if target[1] == t[1] && curr[1] != target[1] {
            flag = true
        }
        if target[2] == t[2] && curr[2] != target[2] {
            flag = true
        }
        if flag {
            temp := make([]int, 3)
            copy(temp, curr)
            curr[0] = max(curr[0], t[0])
            curr[1] = max(curr[1], t[1])
            curr[2] = max(curr[2], t[2])
            if curr[0] > target[0] || curr[1] > target[1] || curr[2] > target[2] {
                curr = temp
            }
        }
    }
    return curr[0] == target[0] && curr[1] == target[1] && curr[2] == target[2]
}

func max(a, b int) int {
    if a > b {
        return a
    }
    return b
}
