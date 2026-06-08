impl Solution {
    pub fn my_pow(mut x: f64, n: i32) -> f64 {
        let mut exp = n as i64;
        if exp < 0 {
            x = 1.0 / x;
            exp = -exp;
        }

        let mut ans = 1.0;
        while exp > 0 {
            if exp % 2 == 1 {
                ans *= x;
            }
            x *= x;
            exp /= 2;
        }
        ans
    }
}
