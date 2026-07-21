impl Solution {
    pub fn longest_subarray(nums: Vec<i32>) -> i32 {
        let mut left = 0;
        let mut zeros = 0;
        let mut res = 0;
        for right in 0..nums.len() {
            if nums[right] == 0 {
                zeros += 1;
            }
            while zeros > 1 {
                if nums[left] == 0 {
                    zeros -= 1;
                }
                left += 1;
            }
            res = res.max((right - left) as i32);
        }
        res
    }
}
