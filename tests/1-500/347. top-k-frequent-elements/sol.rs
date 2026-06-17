impl Solution {
    pub fn top_k_frequent(nums: Vec<i32>, k: i32) -> Vec<i32> {
        use std::collections::HashMap;
        let mut freq: HashMap<i32, (i32, usize)> = HashMap::new();
        for (idx, i) in nums.into_iter().enumerate() {
            freq.entry(i)
                .and_modify(|data| data.0 += 1)
                .or_insert((1, idx));
        }
        let mut vec: Vec<_> = freq.into_iter().collect();
        vec.sort_by(|a, b| b.1 .0.cmp(&a.1 .0).then(a.1 .1.cmp(&b.1 .1)));
        vec.into_iter().take(k as usize).map(|(k, _)| k).collect()
    }
}
