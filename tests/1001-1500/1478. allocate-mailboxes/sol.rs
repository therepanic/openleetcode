impl Solution {
    pub fn min_distance(houses: Vec<i32>, k: i32) -> i32 {
        let mut houses = houses;
        houses.sort();
        let n = houses.len();
        let k = k as usize;
        
        let mut P = vec![0; n + 1];
        for i in 0..n {
            P[i + 1] = P[i] + houses[i];
        }
        
        let mut G = vec![vec![0; n]; n];
        for i in 0..n {
            for j in i..n {
                let mid = (i + j) / 2;
                let count_left = (mid - i + 1) as i32;
                let count_right = (j - mid) as i32;
                let sum_left = P[mid + 1] - P[i];
                let sum_right = P[j + 1] - P[mid + 1];
                G[i][j] = (houses[mid] * count_left - sum_left) + (sum_right - houses[mid] * count_right);
            }
        }
        
        let mut dp = vec![vec![i32::MAX / 2; n + 1]; k + 1];
        dp[0][0] = 0;
        
        for m in 1..=k {
            for j in 1..=n {
                let mut best = i32::MAX;
                for i in 0..j {
                    best = best.min(dp[m-1][i] + G[i][j-1]);
                }
                dp[m][j] = best;
            }
        }
        
        dp[k][n]
    }
}
