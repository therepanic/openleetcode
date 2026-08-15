impl Solution {

    pub fn max_alternating_sum(nums: Vec<i32>) -> i64 {

        let n = nums.len();

        let mut memo = vec![vec![-1i64; 2]; n+1];

        fn solve(idx: usize, flag: usize, nums: &Vec<i32>, n: usize, memo: &mut Vec<Vec<i64>>) -> i64 {

            if idx >= n {

                return 0;

            }

            if memo[idx][flag] != -1 {

                return memo[idx][flag];

            }

            let skip = solve(idx+1, flag, nums, n, memo);

            let mut val = nums[idx] as i64;

            if flag == 0 {

                val = -val;

            }

            let take = val + solve(idx+1, 1 - flag, nums, n, memo);

            memo[idx][flag] = skip.max(take);

            memo[idx][flag]

        }

        solve(0, 1, &nums, n, &mut memo)

    }

}
