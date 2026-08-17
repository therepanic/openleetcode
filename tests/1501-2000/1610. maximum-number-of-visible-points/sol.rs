impl Solution {
    pub fn visible_points(points: Vec<Vec<i32>>, angle: i32, location: Vec<i32>) -> i32 {
        use std::f64::consts::PI;
        
        let mut angles: Vec<f64> = Vec::new();
        let mut same = 0;
        let x0 = location[0];
        let y0 = location[1];
        
        for p in &points {
            let dx = p[0] - x0;
            let dy = p[1] - y0;
            if dx == 0 && dy == 0 {
                same += 1;
                continue;
            }
            let ang = (dy as f64).atan2(dx as f64) * 180.0 / PI;
            angles.push(ang);
        }
        
        if angles.is_empty() {
            return same;
        }
        
        angles.sort_by(|a, b| a.partial_cmp(b).unwrap());
        let n = angles.len();
        let mut full: Vec<f64> = angles.clone();
        for &a in &angles {
            full.push(a + 360.0);
        }
        
        let mut max_vis = 0;
        let mut j = 0;
        for i in 0..n {
            while j < full.len() && full[j] - full[i] <= angle as f64 {
                j += 1;
            }
            max_vis = max_vis.max(j - i);
        }
        
        (max_vis as i32) + same
    }
}
