func earliestAndLatest(n int, firstPlayer int, secondPlayer int) []int {
    return dfs(n, firstPlayer, secondPlayer)
}

func dfs(n, p1, p2 int) []int {
    if p1 + p2 == n + 1 {
        return []int{1, 1}
    }
    if p1 > p2 {
        p1, p2 = p2, p1
    }
    if n <= 4 {
        return []int{2, 2}
    }
    
    m := (n + 1) / 2
    minR := int(^uint(0) >> 1) // max int
    maxR := -minR - 1 // min int
    
    if p1 - 1 > n - p2 {
        t := n + 1 - p1
        p1 = n + 1 - p2
        p2 = t
    }
    
    if p2 * 2 <= n + 1 {
        a := p1 - 1
        b := p2 - p1 - 1
        for i := 0; i <= a; i++ {
            for j := 0; j <= b; j++ {
                r := dfs(m, i + 1, i + j + 2)
                if r[0] + 1 < minR {
                    minR = r[0] + 1
                }
                if r[1] + 1 > maxR {
                    maxR = r[1] + 1
                }
            }
        }
    } else {
        p4 := n + 1 - p2
        a := p1 - 1
        b := p4 - p1 - 1
        c := p2 - p4 - 1
        for i := 0; i <= a; i++ {
            for j := 0; j <= b; j++ {
                offset := i + j + 1 + (c + 1) / 2 + 1
                r := dfs(m, i + 1, offset)
                if r[0] + 1 < minR {
                    minR = r[0] + 1
                }
                if r[1] + 1 > maxR {
                    maxR = r[1] + 1
                }
            }
        }
    }
    
    return []int{minR, maxR}
}
