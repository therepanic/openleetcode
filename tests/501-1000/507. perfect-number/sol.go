func checkPerfectNumber(num int) bool {
    if num == 1 {
        return false
    }
    count := 1
    for i := 2; i*i <= num; i++ {
        if num%i == 0 {
            count += i + num/i
        }
    }
    return num == count
}
