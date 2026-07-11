func deckRevealedIncreasing(deck []int) []int {
    sort.Ints(deck)
    n := len(deck)
    rebuild := []int{deck[n-1]}
    for i := n - 2; i >= 0; i-- {
        last := rebuild[len(rebuild)-1]
        rebuild = rebuild[:len(rebuild)-1]
        rebuild = append([]int{last}, rebuild...)
        rebuild = append([]int{deck[i]}, rebuild...)
    }
    return rebuild
}
