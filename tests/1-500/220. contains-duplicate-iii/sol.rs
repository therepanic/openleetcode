impl Solution {
    pub fn contains_nearby_almost_duplicate(nums: Vec<i32>, index_diff: i32, value_diff: i32) -> bool {
        if index_diff <= 0 || value_diff < 0 {
            return false;
        }

        let width = (value_diff as i64) + 1;
        let mut buckets: std::collections::HashMap<i64, i64> = std::collections::HashMap::new();
        let idx_diff = index_diff as usize;

        for i in 0..nums.len() {
            let x = nums[i] as i64;
            let bid = x.div_euclid(width);

            if buckets.contains_key(&bid) {
                return true;
            }

            if let Some(&v) = buckets.get(&(bid - 1)) {
                if (x - v).abs() <= value_diff as i64 {
                    return true;
                }
            }
            if let Some(&v) = buckets.get(&(bid + 1)) {
                if (x - v).abs() <= value_diff as i64 {
                    return true;
                }
            }

            buckets.insert(bid, x);

            if i >= idx_diff {
                let old = nums[i - idx_diff] as i64;
                let old_bid = old.div_euclid(width);
                buckets.remove(&old_bid);
            }
        }

        false
    }
}
