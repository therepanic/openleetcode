impl Solution {
    pub fn reach_number(target: i32) -> i32 {
        let target = target.abs();
        let n = (((-1.0 + (1.0 + 8.0 * target as f64).sqrt()) / 2.0) as i32);
        let a = n * (n + 1) / 2;
        let b = a + n + 1;
        
        if a == target {
            return n;
        }
        if (b - target) % 2 == 0 {
            return n + 1;
        }
        if (n + 2) % 2 == 1 { n + 2 } else { n + 3 }
    }
}
