func findGoodStrings(n int, s1 string, s2 string, evil string) int {
    const MOD = 1000000007
    m := len(evil)
    
    lps := make([]int, m)
    for i := 1; i < m; i++ {
        j := lps[i - 1]
        for j > 0 && evil[i] != evil[j] {
            j = lps[j - 1]
        }
        if evil[i] == evil[j] {
            lps[i] = j + 1
        }
    }
    
    getNextState := func(currMatch int, c byte) int {
        for currMatch > 0 && c != evil[currMatch] {
            currMatch = lps[currMatch - 1]
        }
        if c == evil[currMatch] {
            currMatch++
        }
        return currMatch
    }
    
    memo := make([][][][]int, n + 1)
    for i := range memo {
        memo[i] = make([][][]int, m + 1)
        for j := range memo[i] {
            memo[i][j] = make([][]int, 2)
            for k := range memo[i][j] {
                memo[i][j][k] = make([]int, 2)
                for l := range memo[i][j][k] {
                    memo[i][j][k][l] = -1
                }
            }
        }
    }
    
    var dp func(idx, eIdx, tightLo, tightHi int) int
    dp = func(idx, eIdx, tightLo, tightHi int) int {
        if eIdx == m {
            return 0
        }
        if idx == n {
            return 1
        }
        
        if memo[idx][eIdx][tightLo][tightHi] != -1 {
            return memo[idx][eIdx][tightLo][tightHi]
        }
        
        res := 0
        lower := byte('a')
        if tightLo == 1 {
            lower = s1[idx]
        }
        upper := byte('z')
        if tightHi == 1 {
            upper = s2[idx]
        }
        
        for c := lower; c <= upper; c++ {
            nextEIdx := getNextState(eIdx, c)
            nextTightLo := 0
            if tightLo == 1 && c == lower {
                nextTightLo = 1
            }
            nextTightHi := 0
            if tightHi == 1 && c == upper {
                nextTightHi = 1
            }
            
            res = (res + dp(idx + 1, nextEIdx, nextTightLo, nextTightHi)) % MOD
        }
        
        memo[idx][eIdx][tightLo][tightHi] = res
        return res
    }
    
    return dp(0, 0, 1, 1)
}
