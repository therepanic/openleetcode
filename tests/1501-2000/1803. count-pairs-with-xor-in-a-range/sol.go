func countPairs(nums []int, low int, high int) int {
    maxVal := 0
    for _, n := range nums {
        if n > maxVal { maxVal = n }
    }
    bits := 1
    if maxVal > 0 {
        bits = int(math.Floor(math.Log2(float64(maxVal)))) + 1
    }
    if bits < 1 { bits = 1 }
    highBits := 0
    if high+1 > 0 {
        highBits = int(math.Floor(math.Log2(float64(high+1)))) + 1
    }
    if highBits > bits { bits = highBits }

    countLess := func(bound int) int {
        if bound <= 0 { return 0 }
        child := [][]int{{-1, -1}}
        counts := []int{0}
        total := 0
        for _, value := range nums {
            node := 0
            for bit := bits - 1; bit >= 0; bit-- {
                v := (value >> bit) & 1
                b := (bound >> bit) & 1
                if b == 1 {
                    same := child[node][v]
                    if same != -1 { total += counts[same] }
                    nxt := child[node][1-v]
                    if nxt == -1 { node = -1; break }
                    node = nxt
                } else {
                    nxt := child[node][v]
                    if nxt == -1 { node = -1; break }
                    node = nxt
                }
            }
            node = 0
            for bit := bits - 1; bit >= 0; bit-- {
                v := (value >> bit) & 1
                nxt := child[node][v]
                if nxt == -1 {
                    nxt = len(child)
                    child[node][v] = nxt
                    child = append(child, []int{-1, -1})
                    counts = append(counts, 0)
                }
                node = child[node][v]
                counts[node]++
            }
        }
        return total
    }

    return countLess(high+1) - countLess(low)
}
