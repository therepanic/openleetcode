impl Solution {
    pub fn max_width_ramp(nums: Vec<i32>) -> i32 {
        let n = nums.len();
        let mut right_max = vec![0; n];
        right_max[n - 1] = nums[n - 1];
        
        for i in (0..n-1).rev() {
            right_max[i] = nums[i].max(right_max[i + 1]);
        }
        
        let mut i = 0;
        let mut j = 0;
        let mut result = 0;
        while j < n {
            if nums[i] <= right_max[j] {
                result = result.max((j - i) as i32);
                j += 1;
            } else {
                i += 1;
            }
        }
        
        result
    }
}
