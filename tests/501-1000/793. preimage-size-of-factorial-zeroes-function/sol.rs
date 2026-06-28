impl Solution {
    pub fn preimage_size_fzf(k: i32) -> i32 {
        fn trailing_zeroes(n: i64) -> i64 {
            let mut count = 0_i64;
            let mut power: i64 = 5;
            while power <= n {
                count += n / power;
                power *= 5;
            }
            count
        }

        let mut start = 4_i64 * k as i64;
        loop {
            let h = trailing_zeroes(start);
            if h == k as i64 {
                return 5;
            }
            if h > k as i64 {
                break;
            }
            start += 1;
        }
        0
    }
}
