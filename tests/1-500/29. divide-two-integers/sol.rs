impl Solution {
    pub fn divide(dividend: i32, divisor: i32) -> i32 {
        if dividend == i32::MIN && divisor == -1 {
            return i32::MAX;
        }
        let q = (dividend as i64) / (divisor as i64);
        q.clamp(i32::MIN as i64, i32::MAX as i64) as i32
    }
}
