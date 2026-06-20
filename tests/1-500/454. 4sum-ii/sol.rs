use std::collections::HashMap;

impl Solution {
    pub fn four_sum_count(nums1: Vec<i32>, nums2: Vec<i32>, nums3: Vec<i32>, nums4: Vec<i32>) -> i32 {
        let mut map = HashMap::new();
        for a in &nums1 {
            for b in &nums2 {
                *map.entry(a + b).or_insert(0) += 1;
            }
        }
        let mut count = 0;
        for c in &nums3 {
            for d in &nums4 {
                count += map.get(&-(c + d)).unwrap_or(&0);
            }
        }
        count
    }
}
