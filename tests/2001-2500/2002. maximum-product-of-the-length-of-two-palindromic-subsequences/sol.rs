impl Solution {
    pub fn max_product(s: String) -> i32 {
        let n = s.len();
        let chars: Vec<char> = s.chars().collect();
        let mut palin_masks: Vec<(i32, i32)> = Vec::new();
        
        for mask in 1u32..(1u32 << n) {
            let mut seq = String::new();
            for i in 0..n {
                if ((mask >> i) & 1) == 1 {
                    seq.push(chars[i]);
                }
            }
            let rev: String = seq.chars().rev().collect();
            if seq == rev {
                let count = mask.count_ones() as i32;
                palin_masks.push((mask as i32, count));
            }
        }
        
        let mut max_product = 0;
        for i in 0..palin_masks.len() {
            for j in (i+1)..palin_masks.len() {
                let (m1, l1) = palin_masks[i];
                let (m2, l2) = palin_masks[j];
                if (m1 & m2) == 0 {
                    max_product = max_product.max(l1 * l2);
                }
            }
        }
        
        max_product
    }
}
