func minDominoRotations(tops []int, bottoms []int) int {
    n := len(tops)
    res := int(^uint(0) >> 1) // max int
    face := make([]int, 7)
    for i := 0; i < n; i++ {
        face[tops[i]]++
        if bottoms[i] != tops[i] {
            face[bottoms[i]]++
        }
    }
    for x := 1; x <= 6; x++ {
        if face[x] < n {
            continue
        }
        maintainTop := 0
        maintainBottom := 0
        possible := true
        for i := 0; i < n; i++ {
            if tops[i] != x {
                maintainTop++
            }
            if bottoms[i] != x {
                maintainBottom++
            }
        }
        if possible {
            if maintainTop < res {
                res = maintainTop
            }
            if maintainBottom < res {
                res = maintainBottom
            }
        }
    }
    if res == int(^uint(0)>>1) {
        return -1
    }
    return res
}
