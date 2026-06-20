use std::collections::HashMap;

impl Solution {
    pub fn find_repeated_dna_sequences(s: String) -> Vec<String> {
        let mut seen: HashMap<String, i32> = HashMap::new();
        let mut ans: Vec<String> = Vec::new();
        if s.len() < 10 {
            return ans;
        }
        for index in 0..=s.len() - 10 {
            let sub = s[index..index + 10].to_string();
            let count = seen.entry(sub.clone()).or_insert(0);
            if *count == 1 {
                ans.push(sub);
            }
            *count += 1;
        }
        ans
    }
}
