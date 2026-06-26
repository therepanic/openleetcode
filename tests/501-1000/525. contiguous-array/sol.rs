impl Solution {
    pub fn find_max_length(nums: Vec<i32>) -> i32 {
        let mut count = 0;
        let mut max_length = 0;
        let mut count_map = std::collections::HashMap::new();
        count_map.insert(0, -1);

        for (i, &num) in nums.iter().enumerate() {
            if num == 0 {
                count -= 1;
            } else {
                count += 1;
            }

            if let Some(&prev_index) = count_map.get(&count) {
                max_length = max_length.max(i as i32 - prev_index);
            } else {
                count_map.insert(count, i as i32);
            }
        }

        max_length
    }
}
