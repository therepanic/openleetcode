func judgeCircle(moves string) bool {
    countL, countR, countU, countD := 0, 0, 0, 0
    for _, c := range moves {
        switch c {
        case 'L':
            countL++
        case 'R':
            countR++
        case 'U':
            countU++
        case 'D':
            countD++
        }
    }
    return countL == countR && countU == countD
}
