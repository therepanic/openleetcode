impl Solution {
    pub fn generate_the_string(n: i32) -> String {
        let n = n as usize;
        if n % 2 == 1 {
            "a".repeat(n)
        } else {
            "a".repeat(n - 1) + "b"
        }
    }
}
