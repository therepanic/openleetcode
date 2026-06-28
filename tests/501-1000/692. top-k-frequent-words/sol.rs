impl Solution {
    pub fn top_k_frequent(words: Vec<String>, k: i32) -> Vec<String> {
        use std::collections::HashMap;
        let mut counter = HashMap::new();
        for w in &words {
            *counter.entry(w.clone()).or_insert(0) += 1;
        }
        let mut heap: Vec<(i32, String)> = counter
            .into_iter()
            .map(|(w, f)| (-f, w))
            .collect();
        heap.sort_by(|a, b| a.0.cmp(&b.0).then(a.1.cmp(&b.1)));
        heap.truncate(k as usize);
        heap.into_iter().map(|(_, w)| w).collect()
    }
}
