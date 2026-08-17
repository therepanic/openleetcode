impl Solution {
    pub fn max_sum_range_query(nums: Vec<i32>, requests: Vec<Vec<i32>>) -> i32 {
        let mut events: Vec<(i32, i32)> = Vec::new();
        let mod_val = 1_000_000_007i64;
        
        for req in &requests {
            events.push((req[0], 1));
            events.push((req[1]+1, -1));
        }
        
        events.sort();
        
        let mut cnt = 0i64;
        let mut prev = -1i64;
        let mut weight: std::collections::HashMap<i64, i64> = std::collections::HashMap::new();
        
        for &(pos, delta) in &events {
            if prev != -1 && cnt != 0 {
                *weight.entry(cnt).or_insert(0) += (pos as i64 - prev);
            }
            prev = pos as i64;
            cnt += delta as i64;
        }
        
        let mut sorted: Vec<(i64, i64)> = weight.into_iter().collect();
        sorted.sort_by(|a, b| b.0.cmp(&a.0));
        
        let mut nums_sorted = nums;
        nums_sorted.sort_by(|a, b| b.cmp(a));
        
        let mut ans = 0i64;
        let mut idx = 0usize;
        
        for (wg, num) in sorted {
            for _ in 0..num {
                ans = (ans + nums_sorted[idx] as i64 * wg) % mod_val;
                idx += 1;
            }
        }
        
        ans as i32
    }
}
