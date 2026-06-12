impl Solution {
    pub fn max_points(points: Vec<Vec<i32>>) -> i32 {
        fn gcd(mut a: i32, mut b: i32) -> i32 {
            while b != 0 {
                let t = a % b;
                a = b;
                b = t;
            }
            a.abs()
        }

        let n = points.len();
        if n <= 2 {
            return n as i32;
        }

        let mut best = 0;
        for i in 0..n {
            let mut count: HashMap<(i32, i32), i32> = HashMap::new();
            let mut local = 0;
            let mut duplicates = 1;
            let x1 = points[i][0];
            let y1 = points[i][1];
            for j in (i + 1)..n {
                let mut dx = points[j][0] - x1;
                let mut dy = points[j][1] - y1;
                if dx == 0 && dy == 0 {
                    duplicates += 1;
                    continue;
                }
                let g = gcd(dx, dy);
                dx /= g;
                dy /= g;
                if dx < 0 {
                    dx = -dx;
                    dy = -dy;
                } else if dx == 0 {
                    dy = 1;
                } else if dy == 0 {
                    dx = 1;
                }
                let entry = count.entry((dx, dy)).or_insert(0);
                *entry += 1;
                local = local.max(*entry);
            }
            best = best.max(local + duplicates);
        }
        best
    }
}
