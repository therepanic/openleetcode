impl Solution {
    pub fn fib(n: i32) -> i32 {
        let sqrt5 = 5.0_f64.sqrt();
        let fib_n = ((1.0 + sqrt5) / 2.0).powi(n) - ((1.0 - sqrt5) / 2.0).powi(n);
        (fib_n / sqrt5).round() as i32
    }
}
