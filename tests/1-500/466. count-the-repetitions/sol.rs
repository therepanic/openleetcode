impl Solution {
    pub fn get_max_repetitions(s1: String, n1: i32, s2: String, n2: i32) -> i32 {
        let m = s1.len() as i64;
        let n = s2.len() as i64;
        let n1 = n1 as i64;
        let n2 = n2 as i64;
        
        if m * n1 < n * n2 {
            return 0;
        }
        
        let mut j = 0usize;
        let mut cnt = 0i64;
        let mut k = 0i64;
        
        let s1_bytes = s1.as_bytes();
        let s2_bytes = s2.as_bytes();
        let n_usize = n as usize;
        
        use std::collections::HashMap;
        let mut seen: HashMap<usize, (i64, i64)> = HashMap::new();
        
        while k < n1 {
            for &ch in s1_bytes.iter() {
                if ch == s2_bytes[j] {
                    j += 1;
                    if j == n_usize {
                        cnt += 1;
                        j = 0;
                    }
                }
            }
            
            k += 1;
            
            if let Some(&(prev_cnt, prev_k)) = seen.get(&j) {
                let period_k = k - prev_k;
                let period_cnt = cnt - prev_cnt;
                
                if period_cnt == 0 {
                    break;
                }
                
                let remaining = n1 - k;
                let cycles = remaining / period_k;
                
                cnt += cycles * period_cnt;
                k += cycles * period_k;
            } else {
                seen.insert(j, (cnt, k));
            }
        }
        
        (cnt / n2) as i32
    }
}
