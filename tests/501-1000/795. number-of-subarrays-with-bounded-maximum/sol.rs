impl Solution {
    pub fn num_subarray_bounded_max(nums: Vec<i32>, left: i32, right: i32) -> i32 {
        let mut res = 0;
        let mut dp = 0;
        let mut prev = -1;
        for i in 0..nums.len() {
            if nums[i] < left && i > 0 {
                res += dp;
            }
            if nums[i] > right {
                dp = 0;
                prev = i as i32;
            }
            if left <= nums[i] && nums[i] <= right {
                dp = i as i32 - prev;
                res += dp;
            }
        }
        res
    }
}
