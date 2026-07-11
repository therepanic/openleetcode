impl Solution {
    pub fn last_stone_weight_ii(stones: Vec<i32>) -> i32 {
        let n = stones.len();
        let total: i32 = stones.iter().sum();
        let target = (total / 2) as usize;
        let mut dp_prev = vec![0; target + 1];
        for i in (0..n).rev() {
            let mut dp_curr = vec![0; target + 1];
            for size in 0..=target {
                let skip = dp_prev[size];
                let take = if size as i32 >= stones[i] {
                    dp_prev[size - stones[i] as usize] + stones[i]
                } else {
                    i32::MIN
                };
                dp_curr[size] = skip.max(take);
            }
            dp_prev = dp_curr;
        }
        total - 2 * dp_prev[target]
    }
}
