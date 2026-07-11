impl Solution {
    pub fn rectangle_area(rectangles: Vec<Vec<i32>>) -> i32 {
        const MOD: i64 = 1_000_000_007;
        const OPEN: i32 = 0;
        const CLOSE: i32 = 1;
        
        let mut events: Vec<(i32, i32, i32, i32)> = Vec::new();
        for r in &rectangles {
            let (x1, y1, x2, y2) = (r[0], r[1], r[2], r[3]);
            events.push((y1, OPEN, x1, x2));
            events.push((y2, CLOSE, x1, x2));
        }
        events.sort_by(|a, b| a.0.cmp(&b.0));
        
        let mut res: i64 = 0;
        let mut cur_y = events[0].0;
        let mut active: Vec<(i32, i32)> = Vec::new();
        
        for &(y, typ, x1, x2) in &events {
            let mut q: i64 = 0;
            let mut cur = -1;
            active.sort_by(|a, b| a.0.cmp(&b.0));
            for &(ax1, ax2) in &active {
                q += std::cmp::max(0, ax2 - std::cmp::max(cur, ax1)) as i64;
                cur = std::cmp::max(cur, ax2);
            }
            
            res = (res + q * (y - cur_y) as i64) % MOD;
            cur_y = y;
            
            if typ == OPEN {
                active.push((x1, x2));
            } else {
                if let Some(pos) = active.iter().position(|&(a, b)| a == x1 && b == x2) {
                    active.remove(pos);
                }
            }
        }
        
        res as i32
    }
}
