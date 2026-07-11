impl Solution {
    pub fn largest_perimeter(nums: Vec<i32>) -> i32 {
        let mut nums = nums;
        let min_val = *nums.iter().min().unwrap();
        let max_val = *nums.iter().max().unwrap();

        let mut freq = vec![0; (max_val - min_val + 1) as usize];
        for &x in &nums {
            freq[(x - min_val) as usize] += 1;
        }

        let mut idx = 0;
        for v in (min_val..=max_val).rev() {
            while freq[(v - min_val) as usize] > 0 {
                nums[idx] = v;
                idx += 1;
                freq[(v - min_val) as usize] -= 1;
            }
        }

        for i in 0..nums.len() - 2 {
            if nums[i + 1] + nums[i + 2] > nums[i] {
                return nums[i] + nums[i + 1] + nums[i + 2];
            }
        }
        0
    }
}
