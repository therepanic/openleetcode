class Solution {
    func findMinFibonacciNumbers(_ k: Int) -> Int {
        var fib = [1, 1]
        while fib.last! <= k {
            fib.append(fib[fib.count - 1] + fib[fib.count - 2])
        }
        
        var count = 0
        var i = fib.count - 1
        var remaining = k
        
        while remaining > 0 {
            if fib[i] <= remaining {
                remaining -= fib[i]
                count += 1
            }
            i -= 1
        }
        
        return count
    }
}
