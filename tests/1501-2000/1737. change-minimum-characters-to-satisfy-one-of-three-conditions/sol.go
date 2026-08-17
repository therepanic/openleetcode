func minCharacters(a string, b string) int {
    freqA := make([]int, 26)
    freqB := make([]int, 26)

    for _, ch := range a {
        freqA[ch-'a']++
    }
    for _, ch := range b {
        freqB[ch-'a']++
    }

    lenA := len(a)
    lenB := len(b)
    res := lenA + lenB + 1
    sumA, sumB := 0, 0

    for i := 0; i < 25; i++ {
        sumA += freqA[i]
        sumB += freqB[i]
        if lenA-sumA+sumB < res {
            res = lenA - sumA + sumB
        }
        if lenB-sumB+sumA < res {
            res = lenB - sumB + sumA
        }
    }

    for i := 0; i < 26; i++ {
        temp := (lenA - freqA[i]) + (lenB - freqB[i])
        if temp < res {
            res = temp
        }
    }

    return res
}
