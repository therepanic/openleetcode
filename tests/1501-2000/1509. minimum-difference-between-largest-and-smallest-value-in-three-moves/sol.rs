impl Solution {
    pub fn min_difference(nums: Vec<i32>) -> i32 {
        if nums.len() <= 3 {
            return 0;
        }
        let mut nums = nums;
        nums.sort();
        let n = nums.len();
        *[
            nums[n-4] - nums[0],
            nums[n-3] - nums[1],
            nums[n-2] - nums[2],
            nums[n-1] - nums[3],
        ].iter().min().unwrap()
    }
}
