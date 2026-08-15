func minDifference(nums []int, queries [][]int) []int {
    maxVal := 0
    for _, x := range nums {
        if x > maxVal {
            maxVal = x
        }
    }
    p := make([][]int, len(nums)+1)
    for i := range p {
        p[i] = make([]int, maxVal+1)
    }
    for j := 0; j <= maxVal; j++ {
        p[0][j] = 0
    }
    for i := 0; i < len(nums); i++ {
        for j := 0; j <= maxVal; j++ {
            add := 0
            if nums[i] == j {
                add = 1
            }
            p[i+1][j] = p[i][j] + add
        }
    }
    res := make([]int, len(queries))
    for qi, q := range queries {
        l, r := q[0], q[1]
        diff := make([]int, maxVal+1)
        for j := 0; j <= maxVal; j++ {
            diff[j] = p[r+1][j] - p[l][j]
        }
        prev := -1
        best := -1
        for j := 0; j <= maxVal; j++ {
            if diff[j] > 0 {
                if prev >= 0 {
                    if best == -1 || j-prev < best {
                        best = j - prev
                    }
                }
                prev = j
            }
        }
        res[qi] = best
    }
    return res
}
