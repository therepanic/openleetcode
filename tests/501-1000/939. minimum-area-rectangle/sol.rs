impl Solution {
    pub fn min_area_rect(points: Vec<Vec<i32>>) -> i32 {
        use std::collections::{HashMap, BTreeMap};
        
        let mut cols: BTreeMap<i32, Vec<i32>> = BTreeMap::new();
        for point in &points {
            let x = point[0];
            let y = point[1];
            cols.entry(x).or_insert_with(Vec::new).push(y);
        }
        
        let mut last_x: HashMap<(i32, i32), i32> = HashMap::new();
        let mut best = i32::MAX;
        
        for (x, ys) in cols.iter_mut() {
            ys.sort();
            for i in 0..ys.len() {
                for j in (i + 1)..ys.len() {
                    let pair = (ys[i], ys[j]);
                    if let Some(&prev_x) = last_x.get(&pair) {
                        let area = (x - prev_x) * (ys[j] - ys[i]);
                        best = best.min(area);
                    }
                    last_x.insert(pair, *x);
                }
            }
        }
        
        if best == i32::MAX { 0 } else { best }
    }
}
