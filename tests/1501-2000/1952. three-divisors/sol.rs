impl Solution {
    pub fn is_three(n: i32) -> bool {
        let mut count = 0;
        for i in 1..=n {
            if n % i == 0 {
                count += 1;
            }
        }
        count == 3
    }
}
