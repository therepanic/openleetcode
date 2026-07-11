impl Solution {
    pub fn nth_magical_number(n: i32, a: i32, b: i32) -> i32 {
        let modulo: i64 = 1_000_000_007;
        let a = a as i64;
        let b = b as i64;
        let n = n as i64;
        let g = Self::gcd(a, b);
        let lcm = a / g * b;
        let mut lo = a.min(b);
        let mut hi = n * lo;
        while lo < hi {
            let mid = (lo + hi) >> 1;
            let cnt = mid / a + mid / b - mid / lcm;
            if cnt < n {
                lo = mid + 1;
            } else {
                hi = mid;
            }
        }
        (lo % modulo) as i32
    }
    
    fn gcd(mut x: i64, mut y: i64) -> i64 {
        while y != 0 {
            let t = y;
            y = x % y;
            x = t;
        }
        x
    }
}
