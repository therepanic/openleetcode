impl Solution {
    pub fn closest_divisors(num: i32) -> Vec<i32> {
        let start = ((num + 2) as f64).sqrt() as i32;
        for d in (1..=start).rev() {
            if (num + 1) % d == 0 {
                return vec![d, (num + 1) / d];
            }
            if (num + 2) % d == 0 {
                return vec![d, (num + 2) / d];
            }
        }
        vec![]
    }
}
