impl Solution {
    pub fn min_pair_sum(nums: Vec<i32>) -> i32 {
        let mut nums = nums;
        nums.sort();
        let mut max_sum = 0;
        let mut l = 0;
        let mut r = nums.len() - 1;
        while l < r {
            max_sum = max_sum.max(nums[l] + nums[r]);
            l += 1;
            r -= 1;
        }
        max_sum
    }
}
