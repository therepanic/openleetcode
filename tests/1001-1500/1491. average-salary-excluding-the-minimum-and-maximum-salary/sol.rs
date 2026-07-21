impl Solution {
    pub fn average(salary: Vec<i32>) -> f64 {
        let max = *salary.iter().max().unwrap();
        let min = *salary.iter().min().unwrap();
        let mut total = 0.0;
        let mut count = 0;
        for &s in &salary {
            if s != max && s != min {
                total += s as f64;
                count += 1;
            }
        }
        total / count as f64
    }
}
