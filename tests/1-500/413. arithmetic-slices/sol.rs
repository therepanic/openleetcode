impl Solution {
    pub fn number_of_arithmetic_slices(nums: Vec<i32>) -> i32 {
        let mut c = 0;
        let mut t = 2;
        for i in 1..nums.len()-1 {
            if nums[i-1] - nums[i] == nums[i] - nums[i+1] {
                t += 1;
            } else {
                t = 2;
            }
            c += t - 2;
        }
        c
    }
}
