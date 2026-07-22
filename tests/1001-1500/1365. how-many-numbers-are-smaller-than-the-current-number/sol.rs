impl Solution {
    pub fn smaller_numbers_than_current(nums: Vec<i32>) -> Vec<i32> {
        let mut all_nums = vec![0; 101];
        let mut res = vec![0; nums.len()];

        for &v in &nums {
            all_nums[v as usize] += 1;
        }

        for v in 1..=100 {
            all_nums[v] += all_nums[v - 1];
        }

        for (i, &v) in nums.iter().enumerate() {
            if v == 0 {
                res[i] = 0;
            } else {
                res[i] = all_nums[(v - 1) as usize];
            }
        }
        res
    }
}
