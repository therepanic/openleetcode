impl Solution {
    pub fn sum_base(n: i32, k: i32) -> i32 {
        let mut total = 0;
        let mut num = n;
        while num > 0 {
            total += num % k;
            num /= k;
        }
        total
    }
}
