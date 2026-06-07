impl Solution {
    pub fn can_jump(nums: Vec<i32>) -> bool {
        let mut farthest = 0usize;
        for (i, &n) in nums.iter().enumerate() {
            if i > farthest {
                return false;
            }
            let reach = i + n as usize;
            if reach > farthest {
                farthest = reach;
            }
            if farthest >= nums.len() - 1 {
                return true;
            }
        }
        true
    }
}
