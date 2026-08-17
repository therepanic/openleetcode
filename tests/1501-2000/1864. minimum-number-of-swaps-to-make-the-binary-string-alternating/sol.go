func minSwaps(s string) int {
    count0 := 0
    count1 := 0
    for _, c := range s {
        if c == '0' {
            count0++
        } else {
            count1++
        }
    }
    
    if abs(count0-count1) > 1 {
        return -1
    }
    
    mismatch0 := 0
    mismatch1 := 0
    for i, c := range s {
        if i%2 == 0 {
            if c != '0' { mismatch0++ }
            if c != '1' { mismatch1++ }
        } else {
            if c != '1' { mismatch0++ }
            if c != '0' { mismatch1++ }
        }
    }
    
    if count0 == count1 {
        return min(mismatch0/2, mismatch1/2)
    } else if count0 > count1 {
        return mismatch0 / 2
    } else {
        return mismatch1 / 2
    }
}

func abs(x int) int {
    if x < 0 { return -x }
    return x
}

func min(a, b int) int {
    if a < b { return a }
    return b
}
