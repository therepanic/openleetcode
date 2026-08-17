impl Solution {
    pub fn sum_of_beauties(nums: Vec<i32>) -> i32 {
        let n = nums.len();
        let mut prefix = vec![0; n];
        let mut suffix = vec![0; n];
        prefix[0] = nums[0];
        suffix[n-1] = nums[n-1];
        for i in 1..n {
            prefix[i] = nums[i-1].max(prefix[i-1]);
        }
        for i in (0..n-1).rev() {
            suffix[i] = nums[i+1].min(suffix[i+1]);
        }
        let mut ans = 0;
        for i in 1..n-1 {
            if prefix[i] < nums[i] && nums[i] < suffix[i] {
                ans += 2;
            } else if nums[i-1] < nums[i] && nums[i] < nums[i+1] {
                ans += 1;
            }
        }
        ans
    }
}
