func bagOfTokensScore(tokens []int, power int) int {
    sort.Ints(tokens)
    n := len(tokens)
    l := 0
    curr := 0
    
    for l < n && tokens[l] <= power {
        power -= tokens[l]
        l++
        curr++
    }
    
    r := n - 1
    res := curr
    
    for l < r && curr > 0 {
        power += tokens[r]
        curr--
        r--
        
        for l <= r && tokens[l] <= power {
            power -= tokens[l]
            l++
            curr++
        }
        if curr > res {
            res = curr
        }
    }
    
    return res
}
