impl Solution {
    pub fn check_subarray_sum(nums: Vec<i32>, k: i32) -> bool {
        if nums.is_empty() {
            return false;
        }

        let mut prefix_sum = 0;
        let mut remainder_map = std::collections::HashMap::new();
        remainder_map.insert(0, -1);

        for (i, &num) in nums.iter().enumerate() {
            prefix_sum += num;
            let remainder = prefix_sum % k;

            if let Some(&prev_idx) = remainder_map.get(&remainder) {
                if i as i32 - prev_idx > 1 {
                    return true;
                }
            } else {
                remainder_map.insert(remainder, i as i32);
            }
        }

        false
    }
}
