impl Solution {
    pub fn connect_two_groups(cost: Vec<Vec<i32>>) -> i32 {
        let m = cost.len();
        let n = cost[0].len();
        let mut mn = vec![0; n];
        for j in 0..n {
            let mut min_val = cost[0][j];
            for i in 1..m {
                min_val = min_val.min(cost[i][j]);
            }
            mn[j] = min_val;
        }
        let mut memo = vec![vec![-1; 1<<n]; m+1];
        fn fn_(i: usize, mask: usize, cost: &Vec<Vec<i32>>, mn: &Vec<i32>, memo: &mut Vec<Vec<i32>>, m: usize, n: usize) -> i32 {
            if memo[i][mask] != -1 { return memo[i][mask]; }
            if i == m {
                let mut sum = 0;
                for j in 0..n {
                    if (mask & (1<<j)) == 0 {
                        sum += mn[j];
                    }
                }
                memo[i][mask] = sum;
            } else {
                let mut best = i32::MAX;
                for j in 0..n {
                    best = best.min(cost[i][j] + fn_(i+1, mask | (1<<j), cost, mn, memo, m, n));
                }
                memo[i][mask] = best;
            }
            memo[i][mask]
        }
        fn_(0, 0, &cost, &mn, &mut memo, m, n)
    }
}
