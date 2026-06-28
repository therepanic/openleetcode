impl Solution {
    pub fn find_max_average(nums: Vec<i32>, k: i32) -> f64 {
        let k = k as usize;
        let mut window_sum: i32 = nums[0..k].iter().sum();
        let mut max_sum = window_sum;
        
        for i in k..nums.len() {
            window_sum = window_sum - nums[i - k] + nums[i];
            max_sum = max_sum.max(window_sum);
        }
        
        max_sum as f64 / k as f64
    }
}
