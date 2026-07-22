func findMinFibonacciNumbers(k int) int {
    fib := []int{1, 1}
    for fib[len(fib)-1] <= k {
        fib = append(fib, fib[len(fib)-1] + fib[len(fib)-2])
    }
    
    count := 0
    i := len(fib) - 1
    
    for k > 0 {
        if fib[i] <= k {
            k -= fib[i]
            count++
        }
        i--
    }
    
    return count
}
