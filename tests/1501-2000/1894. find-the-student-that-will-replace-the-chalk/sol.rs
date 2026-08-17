impl Solution {
    pub fn chalk_replacer(chalk: Vec<i32>, k: i32) -> i32 {
        let total: i64 = chalk.iter().map(|&x| x as i64).sum();
        let mut remaining = (k as i64) % total;
        for (i, &amount) in chalk.iter().enumerate() {
            if remaining < amount as i64 {
                return i as i32;
            }
            remaining -= amount as i64;
        }
        0
    }
}
