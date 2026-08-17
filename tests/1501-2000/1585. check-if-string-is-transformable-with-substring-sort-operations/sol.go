func isTransformable(s string, t string) bool {
    if len(s) != len(t) { return false }
    sc := []byte(s)
    tc := []byte(t)
    sort.Slice(sc, func(i,j int) bool { return sc[i] < sc[j] })
    sort.Slice(tc, func(i,j int) bool { return tc[i] < tc[j] })
    if string(sc) != string(tc) { return false }
    
    pos := make([][]int, 10)
    for i := range pos { pos[i] = []int{} }
    for i, ss := range []byte(s) {
        pos[int(ss-'0')] = append(pos[int(ss-'0')], i)
    }
            
    for _, tt := range []byte(t) {
        i := pos[int(tt-'0')][0]
        pos[int(tt-'0')] = pos[int(tt-'0')][1:]
        for ii := 0; ii < int(tt-'0'); ii++ {
            if len(pos[ii]) > 0 && pos[ii][0] < i { return false }
        }
    }
    return true
}
