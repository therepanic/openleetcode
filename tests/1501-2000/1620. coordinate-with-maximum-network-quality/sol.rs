impl Solution {
    pub fn best_coordinate(towers: Vec<Vec<i32>>, radius: i32) -> Vec<i32> {
        let mut max_x = 0;
        let mut max_y = 0;
        for t in &towers {
            max_x = max_x.max(t[0]);
            max_y = max_y.max(t[1]);
        }
        
        let mut best_quality = 0;
        let mut best_coord = vec![0, 0];
        
        for x in 0..=max_x {
            for y in 0..=max_y {
                let mut quality = 0;
                for t in &towers {
                    let dx = (t[0] - x) as f64;
                    let dy = (t[1] - y) as f64;
                    let dist = (dx * dx + dy * dy).sqrt();
                    if dist <= radius as f64 {
                        quality += (t[2] as f64 / (1.0 + dist)) as i32;
                    }
                }
                if quality > best_quality || (quality == best_quality && (x < best_coord[0] || (x == best_coord[0] && y < best_coord[1]))) {
                    best_quality = quality;
                    best_coord[0] = x;
                    best_coord[1] = y;
                }
            }
        }
        
        best_coord
    }
}
