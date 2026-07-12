func tallestBillboard(rods []int) int {
    n := len(rods)
    mid := (n - 1) >> 1
    
    type pair struct {
        diff   int
        height int
    }
    
    var left, right []pair
    
    var gen func(int, int, int, int, *[]pair)
    gen = func(idx, end, a, b int, vals *[]pair) {
        if idx == end+1 {
            *vals = append(*vals, pair{a - b, b})
            return
        }
        gen(idx+1, end, a, b, vals)
        gen(idx+1, end, a+rods[idx], b, vals)
        gen(idx+1, end, a, b+rods[idx], vals)
    }
    
    gen(0, mid, 0, 0, &left)
    gen(mid+1, n-1, 0, 0, &right)
    
    sort.Slice(left, func(i, j int) bool {
        if left[i].diff != left[j].diff {
            return left[i].diff < left[j].diff
        }
        return left[i].height > left[j].height
    })
    
    sort.Slice(right, func(i, j int) bool {
        if right[i].diff != right[j].diff {
            return right[i].diff < right[j].diff
        }
        return right[i].height > right[j].height
    })
    
    ans := 0
    rightDiffs := make([]int, len(right))
    rightHeights := make([]int, len(right))
    for i, p := range right {
        rightDiffs[i] = p.diff
        rightHeights[i] = p.height
    }
    
    for _, p := range left {
        d, b := p.diff, p.height
        target := -d
        idx := sort.SearchInts(rightDiffs, target)
        if idx < len(rightDiffs) && rightDiffs[idx] == target {
            if b+rightHeights[idx] > ans {
                ans = b + rightHeights[idx]
            }
        }
    }
    return ans
}
