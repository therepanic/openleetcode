impl Solution {
    pub fn longest_awesome(s: String) -> i32 {
        let n = s.len();
        let mut mask = std::collections::HashMap::new();
        let mut cur_mask: u32 = 0;
        mask.insert(cur_mask, -1i32);
        let mut ans = 1i32;
        let bytes = s.as_bytes();
        for i in 0..n {
            let num = bytes[i] - b'0';
            cur_mask ^= 1 << num;
            let need_mask = cur_mask;
            if let Some(&val) = mask.get(&need_mask) {
                ans = ans.max(i as i32 - val);
            }
            for bit in 0..10 {
                let n_need_max = need_mask ^ (1 << bit);
                if let Some(&val) = mask.get(&n_need_max) {
                    ans = ans.max(i as i32 - val);
                }
            }
            mask.entry(cur_mask).or_insert(i as i32);
        }
        ans
    }
}
