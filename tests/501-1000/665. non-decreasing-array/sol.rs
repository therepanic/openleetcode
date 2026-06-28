impl Solution {
    pub fn check_possibility(nums: Vec<i32>) -> bool {
        let mut nums = nums;
        let mut cnt_violations = 0;
        for i in 1..nums.len() {
            if nums[i] < nums[i - 1] {
                if cnt_violations == 1 {
                    return false;
                }
                cnt_violations += 1;
                if i >= 2 && nums[i - 2] > nums[i] {
                    nums[i] = nums[i - 1];
                }
            }
        }
        true
    }
}
