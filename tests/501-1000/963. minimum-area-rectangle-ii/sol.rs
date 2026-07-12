impl Solution {
    pub fn min_area_free_rect(points: Vec<Vec<i32>>) -> f64 {
        use std::collections::HashMap;
        let mut ans = f64::INFINITY;
        let mut seen: HashMap<String, Vec<(i32, i32)>> = HashMap::new();
        let n = points.len();
        for i in 0..n {
            let (x0, y0) = (points[i][0], points[i][1]);
            for j in i+1..n {
                let (x1, y1) = (points[j][0], points[j][1]);
                let cx = (x0 + x1) as f64 / 2.0;
                let cy = (y0 + y1) as f64 / 2.0;
                let d2 = ((x0 - x1) as i64).pow(2) + ((y0 - y1) as i64).pow(2);
                let key = format!("{},{},{}", cx, cy, d2);
                if let Some(list) = seen.get(&key) {
                    for &(xx, yy) in list {
                        let d1 = ((x0 - xx) as f64).powi(2) + ((y0 - yy) as f64).powi(2);
                        let d2 = ((x1 - xx) as f64).powi(2) + ((y1 - yy) as f64).powi(2);
                        let area = (d1 * d2).sqrt();
                        ans = ans.min(area);
                    }
                }
                seen.entry(key).or_default().push((x0, y0));
            }
        }
        if ans.is_infinite() { 0.0 } else { ans }
    }
}
