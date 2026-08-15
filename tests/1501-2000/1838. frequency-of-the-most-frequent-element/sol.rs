impl Solution {
    pub fn max_frequency(nums: Vec<i32>, k: i32) -> i32 {
        let mut nums = nums;
        nums.sort();
        let mut left = 0;
        let mut right = 0;
        let mut res = 0;
        let mut total: i64 = 0;

        while right < nums.len() {
            total += nums[right] as i64;

            while (nums[right] as i64) * ((right - left + 1) as i64) > total + k as i64 {
                total -= nums[left] as i64;
                left += 1;
            }
            
            res = res.max((right - left + 1) as i32);
            right += 1;
        }
        
        res
    }
}
