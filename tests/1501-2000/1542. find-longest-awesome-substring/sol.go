func longestAwesome(s string) int {
    n := len(s)
    mask := make(map[int]int)
    curMask := 0
    mask[curMask] = -1
    ans := 1
    for i := 0; i < n; i++ {
        num := int(s[i] - '0')
        curMask ^= 1 << num
        needMask := curMask
        if val, ok := mask[needMask]; ok {
            if i - val > ans {
                ans = i - val
            }
        }
        for bit := 0; bit < 10; bit++ {
            nNeedMax := needMask ^ (1 << bit)
            if val, ok := mask[nNeedMax]; ok {
                if i - val > ans {
                    ans = i - val
                }
            }
        }
        if _, ok := mask[curMask]; !ok {
            mask[curMask] = i
        }
    }
    return ans
}
