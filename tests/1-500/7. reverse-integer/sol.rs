impl Solution {
    pub fn reverse(mut x: i32) -> i32 {
        let mut res: i64 = 0;
        while x != 0 {
            res = res * 10 + i64::from(x % 10);
            x /= 10;
            if res < i32::MIN as i64 || res > i32::MAX as i64 {
                return 0;
            }
        }
        res as i32
    }
}
