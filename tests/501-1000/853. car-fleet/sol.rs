impl Solution {
    pub fn car_fleet(target: i32, position: Vec<i32>, speed: Vec<i32>) -> i32 {
        let mut cars: Vec<(i32, i32)> = position.into_iter().zip(speed.into_iter()).collect();
        cars.sort_by(|a, b| b.0.cmp(&a.0));
        let mut stack: Vec<f64> = Vec::new();
        for (p, s) in cars {
            let t = (target - p) as f64 / s as f64;
            if stack.is_empty() || t > *stack.last().unwrap() {
                stack.push(t);
            }
        }
        stack.len() as i32
    }
}
