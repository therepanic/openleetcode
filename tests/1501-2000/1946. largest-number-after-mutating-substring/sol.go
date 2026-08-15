func maximumNumber(num string, change []int) string {
    a := []byte(num)
    flag := false
    for i := 0; i < len(a); i++ {
        b := int(a[i] - '0')
        if b < change[b] {
            a[i] = byte(change[b] + '0')
            flag = true
        } else if b == change[b] || !flag {
            continue
        } else {
            break
        }
    }
    return string(a)
}
