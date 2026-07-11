impl Solution {
    pub fn longest_arith_seq_length(nums: Vec<i32>) -> i32 {
        let n = nums.len();
        if n <= 2 {
            return n as i32;
        }
        let mut dp = vec![std::collections::HashMap::<i32, i32>::new(); n];
        let mut ans = 2;
        for i in 0..n {
            for j in 0..i {
                let d = nums[i] - nums[j];
                let prev = *dp[j].get(&d).unwrap_or(&1);
                let current = prev + 1;
                let entry = dp[i].entry(d).or_insert(0);
                if current > *entry {
                    *entry = current;
                }
                if *entry > ans {
                    ans = *entry;
                }
            }
        }
        ans
    }
}
