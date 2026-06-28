impl Solution {
    pub fn repeated_string_match(a: String, b: String) -> i32 {
        let mut repeat_a = a.clone();
        let mut count = 1;

        while repeat_a.len() < b.len() {
            repeat_a.push_str(&a);
            count += 1;
            if repeat_a.contains(&b) {
                return count;
            }
        }

        repeat_a.push_str(&a);
        count += 1;
        if repeat_a.contains(&b) {
            return count;
        }

        -1
    }
}
