impl Solution {
    pub fn find_numbers(nums: Vec<i32>) -> i32 {
        let mut count = 0;
        for &i in &nums {
            let msb = 31 - i.leading_zeros() as i32;
            let mut digits = (msb as f64 * 0.30103) as i32 + 1;
            if i as f64 >= 10_f64.powi(digits) {
                digits += 1;
            }
            if digits % 2 == 0 {
                count += 1;
            }
        }
        count
    }
}
