impl Solution {
    pub fn min_side_jumps(obstacles: Vec<i32>) -> i32 {
        let inf = i32::MAX / 2;
        let mut dp = vec![1, 0, 1];
        for i in 1..obstacles.len() {
            let obs = obstacles[i];
            for j in 0..3 {
                if obs == (j + 1) as i32 {
                    dp[j] = inf;
                }
            }
            for j in 0..3 {
                if obs != (j + 1) as i32 {
                    let min_val = dp[(j + 1) % 3].min(dp[(j + 2) % 3]);
                    dp[j] = dp[j].min(min_val + 1);
                }
            }
        }
        dp.into_iter().min().unwrap()
    }
}
