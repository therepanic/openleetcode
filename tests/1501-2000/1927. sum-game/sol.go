func sumGame(num string) bool {
    n := len(num)
    half := n / 2
    sumLeft, sumRight := 0, 0
    qLeft, qRight := 0, 0

    for i := 0; i < half; i++ {
        if num[i] == '?' {
            qLeft++
        } else {
            sumLeft += int(num[i] - '0')
        }
    }

    for i := half; i < n; i++ {
        if num[i] == '?' {
            qRight++
        } else {
            sumRight += int(num[i] - '0')
        }
    }

    return (sumLeft - sumRight) * 2 != (qRight - qLeft) * 9
}
