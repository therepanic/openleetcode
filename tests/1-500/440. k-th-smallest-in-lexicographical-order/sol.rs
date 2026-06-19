impl Solution {
    pub fn find_kth_number(n: i32, k: i32) -> i32 {
        let mut current = 1_i64;
        let mut remaining = k - 1;
        while remaining > 0 {
            let steps = Self::count_steps(n as i64, current, current + 1);
            if steps <= remaining as i64 {
                current += 1;
                remaining -= steps as i32;
            } else {
                current *= 10;
                remaining -= 1;
            }
        }
        current as i32
    }

    fn count_steps(n: i64, mut prefix: i64, mut next_prefix: i64) -> i64 {
        let limit = n + 1;
        let mut steps = 0_i64;
        while prefix < limit {
            steps += std::cmp::min(limit, next_prefix) - prefix;
            prefix *= 10;
            next_prefix *= 10;
        }
        steps
    }
}
