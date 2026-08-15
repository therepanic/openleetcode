impl Solution {
    pub fn close_strings(word1: String, word2: String) -> bool {
        if word1.len() != word2.len() {
            return false;
        }
        let set1: std::collections::HashSet<char> = word1.chars().collect();
        let set2: std::collections::HashSet<char> = word2.chars().collect();
        if set1 != set2 {
            return false;
        }
        let mut dct: std::collections::HashMap<i32, i32> = std::collections::HashMap::new();
        for x in &set1 {
            let n1 = word1.chars().filter(|c| c == x).count() as i32;
            let n2 = word2.chars().filter(|c| c == x).count() as i32;
            *dct.entry(n1).or_insert(0) += 1;
            *dct.entry(n2).or_insert(0) -= 1;
        }
        dct.values().all(|&v| v == 0)
    }
}
