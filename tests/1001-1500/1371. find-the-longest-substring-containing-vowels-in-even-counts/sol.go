func findTheLongestSubstring(s string) int {
    mapy := make([]int, 32)
    for i := range mapy {
        mapy[i] = -2
    }
    mapy[0] = -1

    res := 0
    mask := 0

    for i, c := range s {
        switch c {
        case 'a':
            mask ^= 1
        case 'e':
            mask ^= 2
        case 'i':
            mask ^= 4
        case 'o':
            mask ^= 8
        case 'u':
            mask ^= 16
        }

        prev := mapy[mask]
        if prev == -2 {
            mapy[mask] = i
        } else {
            if i - prev > res {
                res = i - prev
            }
        }
    }

    return res
}
