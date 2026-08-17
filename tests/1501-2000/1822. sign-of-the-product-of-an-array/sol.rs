impl Solution {
    pub fn array_sign(nums: Vec<i32>) -> i32 {
        if nums.contains(&0) {
            return 0;
        }
        let negatives = nums.iter().filter(|&&num| num < 0).count();
        if negatives % 2 == 0 {
            1
        } else {
            -1
        }
    }
}
