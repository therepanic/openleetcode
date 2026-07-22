impl Solution {
    pub fn get_min_dist_sum(positions: Vec<Vec<i32>>) -> f64 {
        fn dist_sum(positions: &Vec<Vec<i32>>, x: f64, y: f64) -> f64 {
            positions.iter().map(|p| {
                let dx = x - p[0] as f64;
                let dy = y - p[1] as f64;
                (dx * dx + dy * dy).sqrt()
            }).sum()
        }
        
        let n = positions.len() as f64;
        let mut x: f64 = positions.iter().map(|p| p[0] as f64).sum::<f64>() / n;
        let mut y: f64 = positions.iter().map(|p| p[1] as f64).sum::<f64>() / n;
        
        let mut ans = dist_sum(&positions, x, y);
        let mut chg = 100.0f64;
        let dirs = [(-1, 0), (0, -1), (0, 1), (1, 0)];
        
        while chg > 1e-6 {
            let mut zoom = true;
            for &(dx, dy) in &dirs {
                let xx = x + chg * dx as f64;
                let yy = y + chg * dy as f64;
                let dd = dist_sum(&positions, xx, yy);
                if dd < ans {
                    ans = dd;
                    x = xx;
                    y = yy;
                    zoom = false;
                    break;
                }
            }
            if zoom {
                chg /= 2.0;
            }
        }
        ans
    }
}
