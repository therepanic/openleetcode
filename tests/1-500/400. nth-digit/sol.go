func findNthDigit(n int) int {
    i := 1
    count := 9
    start := 1

    for n > i*count {
        n -= i * count
        i++
        count *= 10
        start *= 10
    }

    number := start + (n-1)/i
    str := strconv.Itoa(number)
    return int(str[(n-1)%i] - '0')
}
