impl Solution {
    pub fn find_error_nums(nums: Vec<i32>) -> Vec<i32> {
        let mut nums = nums;
        let mut i = 0;
        while i < nums.len() {
            let correct = (nums[i] - 1) as usize;
            if nums[i] != nums[correct] {
                nums.swap(i, correct);
            } else {
                i += 1;
            }
        }
        
        for i in 0..nums.len() {
            if nums[i] != (i + 1) as i32 {
                return vec![nums[i], (i + 1) as i32];
            }
        }
        vec![]
    }
}
