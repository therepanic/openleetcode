impl Solution {
    pub fn num_points(darts: Vec<Vec<i32>>, r: i32) -> i32 {
        let mut ans = 1;
        let radius = r as f64;
        let radius_sq = radius * radius;
        for i in 0..darts.len() {
            let x1 = darts[i][0] as f64;
            let y1 = darts[i][1] as f64;
            for j in (i + 1)..darts.len() {
                let x2 = darts[j][0] as f64;
                let y2 = darts[j][1] as f64;
                let dx = x2 - x1;
                let dy = y2 - y1;
                let distance_sq = dx * dx + dy * dy;
                if distance_sq > 4.0 * radius_sq { continue; }
                let distance = distance_sq.sqrt();
                let midpoint_x = (x1 + x2) / 2.0;
                let midpoint_y = (y1 + y2) / 2.0;
                let offset = (radius_sq - distance_sq / 4.0).max(0.0).sqrt();
                let normal_x = -dy / distance;
                let normal_y = dx / distance;
                for sign in [-1.0, 1.0] {
                    let center_x = midpoint_x + sign * offset * normal_x;
                    let center_y = midpoint_y + sign * offset * normal_y;
                    let mut count = 0;
                    for dart in &darts {
                        let ex = dart[0] as f64 - center_x;
                        let ey = dart[1] as f64 - center_y;
                        if ex * ex + ey * ey <= radius_sq + 1e-9 { count += 1; }
                    }
                    ans = ans.max(count);
                }
            }
        }
        ans
    }
}
