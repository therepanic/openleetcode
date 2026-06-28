func numJewelsInStones(jewels string, stones string) int {
    count := 0
    for _, i := range jewels {
        for _, s := range stones {
            if i == s {
                count++
            }
        }
    }
    return count
}
