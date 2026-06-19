impl Solution {
    pub fn find_disappeared_numbers(nums: Vec<i32>) -> Vec<i32> {
        let mut nums = nums;
        for i in 0..nums.len() {
            let idx = (nums[i].abs() - 1) as usize;
            if nums[idx] > 0 {
                nums[idx] *= -1;
            }
        }
        let mut res = Vec::new();
        for i in 0..nums.len() {
            if nums[i] > 0 {
                res.push((i + 1) as i32);
            }
        }
        res
    }
}
