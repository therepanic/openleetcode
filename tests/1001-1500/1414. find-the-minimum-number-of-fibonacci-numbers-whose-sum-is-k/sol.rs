impl Solution {
    pub fn find_min_fibonacci_numbers(k: i32) -> i32 {
        let mut fib = vec![1, 1];
        while fib[fib.len() - 1] <= k {
            let next = fib[fib.len() - 1] + fib[fib.len() - 2];
            fib.push(next);
        }
        
        let mut count = 0;
        let mut i = fib.len() - 1;
        let mut remaining = k;
        
        while remaining > 0 {
            if fib[i] <= remaining {
                remaining -= fib[i];
                count += 1;
            }
            if i > 0 {
                i -= 1;
            } else {
                break;
            }
        }
        
        count
    }
}
