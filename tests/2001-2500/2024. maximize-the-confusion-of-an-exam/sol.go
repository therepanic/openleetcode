func maxConsecutiveAnswers(answerKey string, k int) int {
    l := 0
    r := 0
    falseCnt := 0
    trueCnt := 0
    result := 0
    n := len(answerKey)
    for r < n {
        if answerKey[r] == 'T' {
            trueCnt++
        }
        if answerKey[r] == 'F' {
            falseCnt++
        }
        for trueCnt > k && falseCnt > k {
            if answerKey[l] == 'T' {
                trueCnt--
            }
            if answerKey[l] == 'F' {
                falseCnt--
            }
            l++
        }
        if r-l+1 > result {
            result = r - l + 1
        }
        r++
    }
    return result
}
