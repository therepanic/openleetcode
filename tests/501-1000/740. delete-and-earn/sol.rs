impl Solution {
    pub fn delete_and_earn(nums: Vec<i32>) -> i32 {
        use std::collections::HashMap;
        let mut count = HashMap::new();
        for &num in &nums {
            *count.entry(num).or_insert(0) += 1;
        }
        let mut unique_nums: Vec<i32> = count.keys().cloned().collect();
        unique_nums.sort_unstable();
        let mut prev: Option<i32> = None;
        let mut take = 0;
        let mut skip = 0;

        for &num in &unique_nums {
            let max_points = std::cmp::max(skip, take);
            if prev == Some(num - 1) {
                take = num * count[&num] + skip;
                skip = max_points;
            } else {
                take = num * count[&num] + max_points;
                skip = max_points;
            }
            prev = Some(num);
        }

        std::cmp::max(take, skip)
    }
}
