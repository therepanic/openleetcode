func multiply(num1 string, num2 string) string {
    n := len(num1)
    m := len(num2)
    result := make([]int, n+m)

    for i := n - 1; i >= 0; i-- {
        for j := m - 1; j >= 0; j-- {
            mul := int(num1[i]-'0') * int(num2[j]-'0')
            sum := mul + result[i+j+1]
            result[i+j+1] = sum % 10
            result[i+j] += sum / 10
        }
    }

    k := 0
    for k < len(result) && result[k] == 0 {
        k++
    }
    if k == len(result) {
        return "0"
    }

    out := make([]byte, len(result)-k)
    for i := k; i < len(result); i++ {
        out[i-k] = byte(result[i] + '0')
    }
    return string(out)
}
