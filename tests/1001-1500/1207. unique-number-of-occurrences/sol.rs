impl Solution {
    pub fn unique_occurrences(arr: Vec<i32>) -> bool {
        let mut d = std::collections::HashMap::new();
        for &i in &arr {
            *d.entry(i).or_insert(0) += 1;
        }
        let mut s = std::collections::HashSet::new();
        for &value in d.values() {
            if s.contains(&value) {
                return false;
            }
            s.insert(value);
        }
        true
    }
}
