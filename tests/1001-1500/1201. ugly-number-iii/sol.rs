impl Solution {
    pub fn nth_ugly_number(n: i32, a: i32, b: i32, c: i32) -> i32 {
        fn gcd(mut x: i64, mut y: i64) -> i64 {
            while y != 0 {
                let temp = y;
                y = x % y;
                x = temp;
            }
            x
        }
        
        fn lcm(x: i64, y: i64) -> i64 {
            x * y / gcd(x, y)
        }
        
        let la = a as i64;
        let lb = b as i64;
        let lc = c as i64;
        
        let ab = lcm(la, lb);
        let ac = lcm(la, lc);
        let bc = lcm(lb, lc);
        let abc = lcm(ab, lc);
        
        let mut left: i64 = 1;
        let mut right: i64 = 2_000_000_000;
        
        while left < right {
            let mid = left + (right - left) / 2;
            let cnt = mid / la + mid / lb + mid / lc -
                      mid / ab - mid / ac - mid / bc +
                      mid / abc;
            if cnt >= n as i64 {
                right = mid;
            } else {
                left = mid + 1;
            }
        }
        
        left as i32
    }
}
