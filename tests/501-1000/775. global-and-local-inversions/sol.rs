impl Solution {
    pub fn is_ideal_permutation(nums: Vec<i32>) -> bool {
        for (i, &num) in nums.iter().enumerate() {
            if (num - i as i32).abs() > 1 {
                return false;
            }
        }
        true
    }
}
