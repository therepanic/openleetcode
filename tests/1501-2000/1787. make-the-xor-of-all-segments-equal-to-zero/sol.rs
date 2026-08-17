impl Solution {
    pub fn min_changes(nums: Vec<i32>, k: i32) -> i32 {
        use std::collections::HashMap;
        let k = k as usize;
        let mut freq: HashMap<usize, HashMap<i32, i32>> = HashMap::new();
        for (i, &x) in nums.iter().enumerate() {
            *freq.entry(i % k).or_insert_with(HashMap::new).entry(x).or_insert(0) += 1;
        }
        
        let n = 1 << 10;
        let mut dp = vec![i32::MIN; n];
        dp[0] = 0;
        for i in 0..k {
            let mx = *dp.iter().max().unwrap();
            let mut tmp = vec![0; n];
            for x in 0..n {
                let c = dp[x];
                if let Some(map) = freq.get(&i) {
                    for (&xx, &cc) in map {
                        let idx = x ^ xx as usize;
                        tmp[idx] = tmp[idx].max(c + cc).max(mx);
                    }
                }
            }
            dp = tmp;
        }
        (nums.len() as i32) - dp[0]
    }
}
