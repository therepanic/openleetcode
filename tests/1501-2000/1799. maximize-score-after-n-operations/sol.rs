impl Solution {
    pub fn max_score(nums: Vec<i32>) -> i32 {
        let n = nums.len();
        let mut dp = vec![vec![-1; n/2 + 1]; 1 << n];

        fn gcd(a: i32, b: i32) -> i32 {
            if b == 0 { a } else { gcd(b, a % b) }
        }

        fn dfs(nums: &Vec<i32>, dp: &mut Vec<Vec<i32>>, mask: usize, op: usize) -> i32 {
            let n = nums.len();
            if mask == (1 << n) - 1 {
                return 0;
            }
            if dp[mask][op] != -1 {
                return dp[mask][op];
            }
            let mut ans = 0;
            for i in 0..n {
                if (mask & (1 << i)) == 0 {
                    for j in 0..n {
                        if j != i && (mask & (1 << j)) == 0 {
                            let nmask = mask | (1 << i) | (1 << j);
                            let val = dfs(nums, dp, nmask, op + 1) + gcd(nums[i], nums[j]) * op as i32;
                            ans = ans.max(val);
                        }
                    }
                }
            }
            dp[mask][op] = ans;
            ans
        }

        dfs(&nums, &mut dp, 0, 1)
    }
}
