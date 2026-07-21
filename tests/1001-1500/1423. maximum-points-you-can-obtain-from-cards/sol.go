func maxScore(cardPoints []int, k int) int {
    l := 0
    n := len(cardPoints)
    total := 0
    for i := n - k; i < n; i++ {
        total += cardPoints[i]
    }
    res := total
    for r := n - k; r < n; r++ {
        total += cardPoints[l] - cardPoints[r]
        if total > res {
            res = total
        }
        l++
    }
    return res
}
