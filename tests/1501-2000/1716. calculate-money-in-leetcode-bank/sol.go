func totalMoney(n int) int {
    q := n / 7
    r := n % 7
    return arithmeticProgression(28, 28+(q-1)*7, q) + arithmeticProgression(q+1, q+r, r)
}

func arithmeticProgression(leading, last, terms int) int {
    return (leading+last)*terms/2
}
