impl Solution {
    pub fn max_subarray_sum_circular(nums: Vec<i32>) -> i32 {
        let mut max_sum = nums[0];
        let mut min_sum = nums[0];
        let mut curr_max_sum = nums[0];
        let mut curr_min_sum = nums[0];
        let mut total_sum = nums[0];
        
        for i in 1..nums.len() {
            curr_max_sum = (curr_max_sum + nums[i]).max(nums[i]);
            max_sum = max_sum.max(curr_max_sum);
            
            curr_min_sum = (curr_min_sum + nums[i]).min(nums[i]);
            min_sum = min_sum.min(curr_min_sum);
            
            total_sum += nums[i];
        }
        
        let circular_sum = total_sum - min_sum;
        
        if circular_sum == 0 {
            return max_sum;
        }
        
        max_sum.max(circular_sum)
    }
}
