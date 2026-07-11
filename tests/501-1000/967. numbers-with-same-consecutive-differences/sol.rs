impl Solution {
    pub fn nums_same_consec_diff(n: i32, k: i32) -> Vec<i32> {
        use std::collections::HashSet;
        let mut res: HashSet<i32> = (1..=9).collect();
        let mut remaining = n - 1;
        
        while remaining > 0 {
            let mut next = HashSet::new();
            for &val in &res {
                let last = val % 10;
                if last + k < 10 {
                    next.insert(val * 10 + last + k);
                }
                if last - k >= 0 {
                    next.insert(val * 10 + last - k);
                }
            }
            res = next;
            remaining -= 1;
        }
        
        res.into_iter().collect()
    }
}
