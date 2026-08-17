func decode(encoded []int) []int {
    n := len(encoded) + 1
    xr := 0
    for i := 1; i <= n; i++ {
        xr ^= i
    }
    nxr := 0
    for i, v := range encoded {
        if i%2 == 1 {
            nxr ^= v
        }
    }
    perm := make([]int, n)
    perm[0] = xr ^ nxr
    for i, v := range encoded {
        perm[i+1] = v ^ perm[i]
    }
    return perm
}
