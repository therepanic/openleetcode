func maxCoins(piles []int) int {
    sort.Ints(piles)
    l := 0
    r := len(piles)
    count := 0
    for i := 0; i < len(piles)/3; i++ {
        count += piles[r-2]
        l += 1
        r -= 2
    }
    return count
}
