impl Solution {
    pub fn poor_pigs(buckets: i32, minutes_to_die: i32, minutes_to_test: i32) -> i32 {
        let base = minutes_to_test / minutes_to_die + 1;
        let mut ans = 0;
        let mut n = 1;
        while n < buckets {
            n *= base;
            ans += 1;
        }
        ans
    }
}
