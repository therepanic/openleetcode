impl Solution {
    pub fn count_consistent_strings(allowed: String, words: Vec<String>) -> i32 {
        let mut result = 0;
        let allowed_set: std::collections::HashSet<char> = allowed.chars().collect();
        for word in words {
            let mut all_in = true;
            for c in word.chars() {
                if !allowed_set.contains(&c) {
                    all_in = false;
                    break;
                }
            }
            if all_in {
                result += 1;
            }
        }
        result
    }
}
