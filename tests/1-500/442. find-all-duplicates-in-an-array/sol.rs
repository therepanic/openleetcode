impl Solution {
    pub fn find_duplicates(nums: Vec<i32>) -> Vec<i32> {
        let mut nums = nums;
        let mut r = Vec::new();
        let len = nums.len();
        for i in 0..len {
            let x = nums[i];
            let idx = (x.abs() - 1) as usize;
            if nums[idx] < 0 {
                r.push(x.abs());
            } else {
                nums[idx] = -nums[idx];
            }
        }
        r
    }
}
