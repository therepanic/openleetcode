func originalDigits(s string) string {
    c := make(map[byte]int)
    for i := 0; i < len(s); i++ {
        c[s[i]]++
    }
    d := make([]int, 10)
    d[0] = c['z']
    d[2] = c['w']
    d[4] = c['u']
    d[6] = c['x']
    d[8] = c['g']
    d[1] = c['o'] - d[0] - d[2] - d[4]
    d[3] = c['h'] - d[8]
    d[5] = c['f'] - d[4]
    d[7] = c['s'] - d[6]
    d[9] = c['i'] - d[5] - d[6] - d[8]
    res := make([]byte, 0)
    for i := 0; i <= 9; i++ {
        digit := byte('0' + i)
        for j := 0; j < d[i]; j++ {
            res = append(res, digit)
        }
    }
    return string(res)
}
