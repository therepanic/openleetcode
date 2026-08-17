impl Solution {
    pub fn are_occurrences_equal(s: String) -> bool {
        let mut map = std::collections::HashMap::new();
        for c in s.chars() {
            *map.entry(c).or_insert(0) += 1;
        }
        let mut unique_vals = std::collections::HashSet::new();
        for v in map.values() {
            unique_vals.insert(*v);
        }
        unique_vals.len() == 1
    }
}
