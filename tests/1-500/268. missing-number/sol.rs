impl Solution {
    pub fn missing_number(nums: Vec<i32>) -> i32 {
        let l = nums.len() as i32;
        let mut total = l;
        let mut summ = 0;
        for i in 0..nums.len() {
            total += i as i32;
            summ += nums[i];
        }
        total - summ
    }
}
