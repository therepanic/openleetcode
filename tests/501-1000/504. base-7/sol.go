func convertToBase7(num int) string {
    if num == 0 {
        return "0"
    }
    sign := ""
    if num < 0 {
        sign = "-"
        num = -num
    }
    result := ""
    for num > 0 {
        result = strconv.Itoa(num % 7) + result
        num /= 7
    }
    return sign + result
}
