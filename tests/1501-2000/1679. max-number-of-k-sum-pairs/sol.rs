impl Solution {
    pub fn max_operations(nums: Vec<i32>, k: i32) -> i32 {
        let mut nums = nums;
        nums.sort();
        let (mut i, mut j) = (0, nums.len() - 1);
        let mut count = 0;

        while i < j {
            let total = nums[i] + nums[j];
            if total == k {
                count += 1;
                i += 1;
                j -= 1;
            } else if total > k {
                j -= 1;
            } else {
                i += 1;
            }
        }

        count
    }
}
