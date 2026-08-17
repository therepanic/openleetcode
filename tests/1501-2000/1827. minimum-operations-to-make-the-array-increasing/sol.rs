impl Solution {
    pub fn min_operations(nums: Vec<i32>) -> i32 {
        let mut c = nums[0];
        let mut s = 0;
        for i in 1..nums.len() {
            if nums[i] > c {
                c = nums[i];
            } else {
                c += 1;
                s += c - nums[i];
            }
        }
        s
    }
}
