func closestCost(baseCosts []int, toppingCosts []int, target int) int {
    s := []int{0}
    for _, i := range toppingCosts {
        ss := make([]int, 0)
        for _, j := range s {
            ss = append(ss, j, j+i, j+2*i)
        }
        s = ss
    }
    sort.Ints(s)
    ans := 1000000000
    fans := 1000000000
    n := len(s)
    for _, i := range baseCosts {
        j := target - i
        x := sort.SearchInts(s, j) - 1
        if x < 0 { x = 0 }
        ans1 := abs(j - s[x])
        if ans1 < ans {
            ans = ans1
            fans = s[x] + i
        } else if ans1 == ans {
            if s[x] + i < fans { fans = s[x] + i }
        }
        if x + 1 < n {
            x++
            ans1 = abs(j - s[x])
            if ans1 < ans {
                ans = ans1
                fans = s[x] + i
            } else if ans1 == ans {
                if s[x] + i < fans { fans = s[x] + i }
            }
        }
    }
    return fans
}

func abs(x int) int {
    if x < 0 { return -x }
    return x
}
