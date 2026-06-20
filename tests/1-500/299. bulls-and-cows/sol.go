func getHint(secret string, guess string) string {
    bulls := 0
    secretCounts := make([]int, 10)
    guessCounts := make([]int, 10)

    for i := 0; i < len(secret); i++ {
        s := secret[i]
        g := guess[i]
        if s == g {
            bulls++
        } else {
            secretCounts[s-'0']++
            guessCounts[g-'0']++
        }
    }

    cows := 0
    for i := 0; i < 10; i++ {
        if secretCounts[i] < guessCounts[i] {
            cows += secretCounts[i]
        } else {
            cows += guessCounts[i]
        }
    }
    return fmt.Sprintf("%dA%dB", bulls, cows)
}
