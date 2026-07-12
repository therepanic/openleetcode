impl Solution {
    pub fn rearrange_barcodes(barcodes: Vec<i32>) -> Vec<i32> {
        use std::collections::HashMap;

        let mut counts = HashMap::new();
        for &v in &barcodes {
            *counts.entry(v).or_insert(0usize) += 1;
        }

        let mut items: Vec<(i32, usize)> = counts.into_iter().collect();
        items.sort_by(|a, b| b.1.cmp(&a.1).then_with(|| a.0.cmp(&b.0)));

        let mut res = vec![0; barcodes.len()];
        let mut idx = 0usize;
        for (val, cnt) in items {
            for _ in 0..cnt {
                if idx >= res.len() {
                    idx = 1;
                }
                res[idx] = val;
                idx += 2;
            }
        }
        res
    }
}
