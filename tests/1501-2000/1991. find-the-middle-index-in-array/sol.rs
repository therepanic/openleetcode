impl Solution {
    pub fn find_middle_index(nums: Vec<i32>) -> i32 {
        let total: i32 = nums.iter().sum();
        let mut left_sum = 0;
        let mut right_sum = total;
        
        for (i, &num) in nums.iter().enumerate() {
            right_sum -= num;
            if left_sum == right_sum {
                return i as i32;
            }
            left_sum += num;
        }
        
        -1
    }
}
