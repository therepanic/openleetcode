impl Solution {
    pub fn num_of_ways(nums: Vec<i32>) -> i32 {
        const MOD: i64 = 1000000007;
        let n = nums.len();
        
        let mut ncr = vec![vec![0i64; n+1]; n+1];
        for i in 0..=n {
            ncr[i][0] = 1;
            ncr[i][i] = 1;
            for j in 1..i {
                ncr[i][j] = (ncr[i-1][j-1] + ncr[i-1][j]) % MOD;
            }
        }
        
        fn dfs(nums: &[i32], ncr: &Vec<Vec<i64>>) -> i64 {
            if nums.len() <= 2 { return 1; }
            let root = nums[0];
            let left: Vec<i32> = nums[1..].iter().filter(|&&x| x < root).cloned().collect();
            let right: Vec<i32> = nums[1..].iter().filter(|&&x| x > root).cloned().collect();
            let left_ways = dfs(&left, ncr);
            let right_ways = dfs(&right, ncr);
            let l = left.len();
            let r = right.len();
            return (ncr[l+r][l] * left_ways % 1000000007 * right_ways) % 1000000007;
        }
        
        let result = dfs(&nums, &ncr);
        (((result - 1) % MOD + MOD) % MOD) as i32
    }
}
