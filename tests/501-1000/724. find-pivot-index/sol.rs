impl Solution {
    pub fn pivot_index(nums: Vec<i32>) -> i32 {
        let total_sum: i32 = nums.iter().sum();
        let mut l_sum = 0;
        let mut r_sum = total_sum;
        for i in 0..nums.len() {
            r_sum -= nums[i];
            if l_sum == r_sum {
                return i as i32;
            }
            l_sum += nums[i];
        }
        -1
    }
}
