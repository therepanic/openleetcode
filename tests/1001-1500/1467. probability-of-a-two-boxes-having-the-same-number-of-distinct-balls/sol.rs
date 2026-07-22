impl Solution {
    pub fn get_probability(balls: Vec<i32>) -> f64 {
        use std::collections::HashMap;
        
        let sm: i32 = balls.iter().sum();
        let mut expanded = Vec::new();
        for (i, &b) in balls.iter().enumerate() {
            for _ in 0..b {
                expanded.push(i as i32);
            }
        }
        
        let mut memo: HashMap<String, i64> = HashMap::new();
        
        fn dp(i: usize, cnt0: i32, mask0: i32, mask1: i32, sm: i32, expanded: &[i32], memo: &mut HashMap<String, i64>) -> i64 {
            let key = format!("{},{},{},{}", i, cnt0, mask0, mask1);
            if let Some(&val) = memo.get(&key) {
                return val;
            }
            
            let cnt1 = i as i32 - cnt0;
            if cnt0 > sm / 2 || cnt1 > sm / 2 {
                memo.insert(key, 0);
                return 0;
            }
            
            if i == expanded.len() {
                let result = if mask0.count_ones() == mask1.count_ones() { 1 } else { 0 };
                memo.insert(key, result);
                return result;
            }
            
            let result = dp(i + 1, cnt0 + 1, mask0 | (1 << expanded[i]), mask1, sm, expanded, memo) +
                         dp(i + 1, cnt0, mask0, mask1 | (1 << expanded[i]), sm, expanded, memo);
            memo.insert(key, result);
            result
        }
        
        fn comb(n: i32, k: i32) -> i64 {
            let mut res: i64 = 1;
            for i in 1..=k {
                res = res * (n - k + i) as i64 / i as i64;
            }
            res
        }
        
        let favorable = dp(0, 0, 0, 0, sm, &expanded, &mut memo);
        let total = comb(sm, sm / 2);
        favorable as f64 / total as f64
    }
}
