impl Solution {
    pub fn smallest_range_ii(mut nums: Vec<i32>, k: i32) -> i32 {
        nums.sort();
        let n = nums.len();
        let mut ans = nums[n - 1] - nums[0];
        for i in 0..n - 1 {
            let high = std::cmp::max(nums[n - 1] - k, nums[i] + k);
            let low = std::cmp::min(nums[0] + k, nums[i + 1] - k);
            ans = std::cmp::min(ans, high - low);
        }
        ans
    }
}
