func scoreOfStudents(s string, answers []int) int {
    memo := make(map[[2]int]map[int]bool)
    
    var fn func(lo, hi int) map[int]bool
    fn = func(lo, hi int) map[int]bool {
        key := [2]int{lo, hi}
        if val, ok := memo[key]; ok {
            return val
        }
        if lo+1 == hi {
            res := map[int]bool{int(s[lo]-'0'): true}
            memo[key] = res
            return res
        }
        res := make(map[int]bool)
        for mid := lo + 1; mid < hi; mid += 2 {
            for x := range fn(lo, mid) {
                for y := range fn(mid+1, hi) {
                    if s[mid] == '+' && x+y <= 1000 {
                        res[x+y] = true
                    } else if s[mid] == '*' && x*y <= 1000 {
                        res[x*y] = true
                    }
                }
            }
        }
        memo[key] = res
        return res
    }
    
    // evaluate target with precedence
    nums := []int{}
    ops := []byte{}
    for i := 0; i < len(s); i++ {
        c := s[i]
        if c >= '0' && c <= '9' {
            nums = append(nums, int(c-'0'))
        } else if c == '+' || c == '*' {
            for len(ops) > 0 && precedence(ops[len(ops)-1]) >= precedence(c) {
                apply(&nums, &ops)
            }
            ops = append(ops, c)
        }
    }
    for len(ops) > 0 {
        apply(&nums, &ops)
    }
    target := nums[len(nums)-1]
    
    cand := fn(0, len(s))
    score := 0
    for _, x := range answers {
        if x == target {
            score += 5
        } else if cand[x] {
            score += 2
        }
    }
    return score
}

func precedence(c byte) int {
    if c == '*' {
        return 2
    }
    return 1
}

func apply(nums *[]int, ops *[]byte) {
    b := (*nums)[len(*nums)-1]
    *nums = (*nums)[:len(*nums)-1]
    a := (*nums)[len(*nums)-1]
    *nums = (*nums)[:len(*nums)-1]
    op := (*ops)[len(*ops)-1]
    *ops = (*ops)[:len(*ops)-1]
    if op == '+' {
        *nums = append(*nums, a+b)
    } else {
        *nums = append(*nums, a*b)
    }
}
