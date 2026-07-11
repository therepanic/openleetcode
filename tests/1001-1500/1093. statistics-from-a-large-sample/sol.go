func sampleStats(count []int) []float64 {
    kth := func(k int) int {
        acc := 0
        for v, c := range count {
            acc += c
            if acc >= k {
                return v
            }
        }
        return 0
    }

    tot := 0
    cnt := 0
    mini := -1
    maxi := 0
    mode := 0
    modeCnt := 0

    for v, c := range count {
        if c > 0 {
            if mini == -1 {
                mini = v
            }
            maxi = v
            tot += c
            cnt += v * c
            if c > modeCnt {
                modeCnt = c
                mode = v
            }
        }
    }

    var m float64
    if tot%2 == 1 {
        m = float64(kth(tot/2 + 1))
    } else {
        m = float64(kth(tot/2)+kth(tot/2+1)) / 2.0
    }

    return []float64{float64(mini), float64(maxi), float64(cnt) / float64(tot), m, float64(mode)}
}
