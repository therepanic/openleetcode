impl Solution {
    pub fn minimum_difference(nums: Vec<i32>, k: i32) -> i32 {
        let mut nums = nums;
        nums.sort();
        let n = nums.len();
        let k = k as usize;
        let mut ans = nums[k - 1] - nums[0];
        for i in 0..=(n - k) {
            ans = ans.min(nums[i + k - 1] - nums[i]);
        }
        ans
    }
}
