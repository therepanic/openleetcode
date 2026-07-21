func maxNumberOfBalloons(text string) int {
    f := make(map[rune]int)
    for _, c := range text {
        f[c]++
    }
    return min(f['b'], f['a'], f['l']/2, f['o']/2, f['n'])
}
