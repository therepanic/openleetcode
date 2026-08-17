impl Solution {
    pub fn num_triplets(nums1: Vec<i32>, nums2: Vec<i32>) -> i32 {
        fn count_pairs(nums_a: &Vec<i32>, nums_b: &Vec<i32>) -> i32 {
            use std::collections::HashMap;
            let mut freq: HashMap<i64, i32> = HashMap::new();
            for i in 0..nums_b.len() {
                for j in (i+1)..nums_b.len() {
                    let prod = nums_b[i] as i64 * nums_b[j] as i64;
                    *freq.entry(prod).or_insert(0) += 1;
                }
            }
            let mut count = 0;
            for &num in nums_a {
                let sq = num as i64 * num as i64;
                count += freq.get(&sq).copied().unwrap_or(0);
            }
            count
        }
        count_pairs(&nums1, &nums2) + count_pairs(&nums2, &nums1)
    }
}
