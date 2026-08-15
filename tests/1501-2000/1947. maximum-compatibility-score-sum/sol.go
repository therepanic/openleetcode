func maxCompatibilitySum(students [][]int, mentors [][]int) int {
    m := len(students)
    maxScore := 0
    perm := make([]int, m)
    for i := 0; i < m; i++ { perm[i] = i }
    for {
        total := 0
        for i := 0; i < m; i++ {
            for j := 0; j < len(students[i]); j++ {
                if students[i][j] == mentors[perm[i]][j] { total++ }
            }
        }
        if total > maxScore { maxScore = total }
        if !nextPermutation(perm) { break }
    }
    return maxScore
}

func nextPermutation(a []int) bool {
    n := len(a)
    i := n - 2
    for i >= 0 && a[i] >= a[i+1] { i-- }
    if i < 0 { return false }
    j := n - 1
    for a[j] <= a[i] { j-- }
    a[i], a[j] = a[j], a[i]
    for l, r := i+1, n-1; l < r; l, r = l+1, r-1 {
        a[l], a[r] = a[r], a[l]
    }
    return true
}
