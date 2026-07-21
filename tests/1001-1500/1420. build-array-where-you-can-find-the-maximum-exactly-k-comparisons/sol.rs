impl Solution {
    pub fn num_of_arrays(n: i32, m: i32, k: i32) -> i32 {
        const MOD: i32 = 1_000_000_007;
        let n = n as usize;
        let m = m as usize;
        let k = k as usize;
        let mut dp = vec![vec![vec![-1; m + 1]; k + 1]; n + 1];

        fn solve(idx: usize, search_cost: usize, max_value: usize, n: usize, m: usize, k: usize, dp: &mut Vec<Vec<Vec<i32>>>, modulo: i32) -> i32 {
            if idx == n {
                return if search_cost == k { 1 } else { 0 };
            }
            if search_cost > k {
                return 0;
            }
            if dp[idx][search_cost][max_value] != -1 {
                return dp[idx][search_cost][max_value];
            }

            let mut result = 0;
            for i in 1..=m {
                if i > max_value {
                    result = (result + solve(idx + 1, search_cost + 1, i, n, m, k, dp, modulo)) % modulo;
                } else {
                    result = (result + solve(idx + 1, search_cost, max_value, n, m, k, dp, modulo)) % modulo;
                }
            }

            dp[idx][search_cost][max_value] = result;
            result
        }

        solve(0, 0, 0, n, m, k, &mut dp, MOD)
    }
}
