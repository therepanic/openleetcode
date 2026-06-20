func isAdditiveNumber(num string) bool {
    addStrings := func(a, b string) string {
        i, j, carry := len(a)-1, len(b)-1, 0
        out := make([]byte, 0, len(a)+len(b))
        for i >= 0 || j >= 0 || carry != 0 {
            sum := carry
            if i >= 0 {
                sum += int(a[i] - '0')
                i--
            }
            if j >= 0 {
                sum += int(b[j] - '0')
                j--
            }
            out = append(out, byte('0'+sum%10))
            carry = sum / 10
        }
        for l, r := 0, len(out)-1; l < r; l, r = l+1, r-1 {
            out[l], out[r] = out[r], out[l]
        }
        return string(out)
    }

    n := len(num)
    for i := 1; i < n; i++ {
        if num[0] == '0' && i > 1 {
            break
        }
        for j := i + 1; j < n; j++ {
            if num[i] == '0' && j > i+1 {
                break
            }
            a := num[:i]
            b := num[i:j]
            k := j
            used := 2
            for k < n {
                c := addStrings(a, b)
                if k+len(c) > n || num[k:k+len(c)] != c {
                    break
                }
                k += len(c)
                a, b = b, c
                used++
            }
            if k == n && used >= 3 {
                return true
            }
        }
    }
    return false
}
