impl Solution {
    pub fn integer_replacement(n: i32) -> i32 {
        fn helper(x: i64, c: i32) -> i32 {
            if x == 1 {
                return c;
            }
            if x % 2 == 0 {
                return helper(x >> 1, c + 1);
            } else {
                if x == 3 || ((x >> 1) & 1) == 0 {
                    return helper(x - 1, c + 1);
                } else {
                    return helper(x + 1, c + 1);
                }
            }
        }
        helper(n as i64, 0)
    }
}
